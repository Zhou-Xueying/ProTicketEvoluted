package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.MemberDao;
import edu.nju.proticket.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import edu.nju.proticket.service.MemberService;
import edu.nju.proticket.utils.MD5Util;
import edu.nju.proticket.utils.SendEmail;
import edu.nju.proticket.utils.ServiceException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberDao memberDao;

    public boolean hasRegistered(String email) {
        if(memberDao.findByEmail(email)!=null){
            return true;
        }else{
            return false;
        }
    }

    public void processRegister(String email, String userName, String password){
        Member member = new Member();
        member.setUsername(userName);
        member.setEmail(email);
        member.setPassword(password);
        member.setStatus(0);
        member.setValidatecode(MD5Util.encode2hex(email));

        memberDao.register(member);//保存注册信息

        ///邮件的内容
        StringBuffer sb=new StringBuffer("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8090/register.form?action=activate&email=");
        sb.append(email);
        sb.append("&validateCode=");
        sb.append(member.getValidatecode());
        sb.append("\">http://localhost:8090/register?action=activate&email=");
        sb.append(email);
        sb.append("&validateCode=");
        sb.append(member.getValidatecode());
        sb.append("</a>");

        //发送邮件
        SendEmail.send(email, sb.toString());
        System.out.println("发送邮件");
    }

    /**
     * 处理激活
     * @throws ParseException
     */
    ///传递激活码和email过来
    @Transactional
    public void processActivate(String email , String validateCode)throws ServiceException, ParseException {
        //数据访问层，通过email获取用户信息
        Member member = memberDao.findUnvalidatedUserByEmail(email);
        //验证用户是否存在
        if(member!=null) {
            //验证用户激活状态
            if(member.getStatus()==0) {
                ///没激活
//                Date currentTime = new Date();//获取当前时间
//                //验证链接是否过期
//                currentTime.before(user.getRegisterTime());
//                if(currentTime.before(user.getLastActivateTime())) {
//                    //验证激活码是否正确
                if(validateCode.equals(member.getValidatecode())) {
                        //激活成功， //并更新用户的激活状态，为已激活
//                    System.out.println("==sq==="+member.getStatus());
                    member.setStatus(1);//把状态改为激活
//                    System.out.println("==sh==="+member.getStatus());
                    memberDao.updateProfile(member);
                } else {
                    throw new ServiceException("激活码不正确");
                }
//                } else {
//                      throw new ServiceException("激活码已过期！");
//                }
            } else {
                throw new ServiceException("邮箱已激活，请登录！");
            }
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }

    }

//    public boolean register(Member member) {
//        return memberDao.register(member);
//    }

    public boolean login(String email, String password) {
        return memberDao.login(email,password);
    }

    public Member getProfile(int memberId) {
        return memberDao.getProfile(memberId);
    }

    public Member getProfileByEmail(String email) {
        return memberDao.findByEmail(email);
    }

    public boolean updateProfile(Member member) {
        return memberDao.updateProfile(member);
    }

    public boolean deleteMember(Member member) {
        member.setStatus(-1);
        return memberDao.updateProfile(member);
    }

    public boolean consumptionsUp(int memberId, double money) {
        return memberDao.consumptionsUp(memberId, money);
    }

    public boolean levelUp(int memberId) {
        return memberDao.levelUp((memberId));
    }

    public int level(double consumptions){
        if(consumptions>0&&consumptions<=300){
            return 1;
        }else if(consumptions>300&&consumptions<=800){
            return 2;
        }else if(consumptions>800&&consumptions<=1500){
            return  3;
        }else if(consumptions>1500&&consumptions<=2500){
            return 4;
        }else if(consumptions>2500&&consumptions<=4000){
            return 5;
        }else if(consumptions>400&&consumptions<=6000){
            return 6;
        }else if(consumptions>6000){
            return 7;
        }else {
            return 0;
        }
    }

    public double discount(int level){
        switch (level){
            case 1:
                return 0.98;
            case 2:
                return 0.96;
            case 3:
                return 0.94;
            case 4:
                return 0.92;
            case 5:
                return 0.90;
            case 6:
                return 0.88;
            case 7:
                return 0.85;
            default:
                    return 1.00;
        }
    }

    public List<Member> getMembers() {
        return memberDao.getMembers();
    }
}
