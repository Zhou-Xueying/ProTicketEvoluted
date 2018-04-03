package edu.nju.proticket.service;

import edu.nju.proticket.model.Member;
import edu.nju.proticket.utils.ServiceException;
import org.springframework.stereotype.Service;

import java.text.ParseException;

public interface MemberService {

    /**
     *
     * @param email
     * @return true:has registered;false:hasn't registered
     */
    public boolean hasRegistered(String email);

    /**
     *
     * @param email
     * @param userName
     * @param password
     */
    public void processRegister(String email, String userName, String password);

    /**
     *
     * @param email
     * @param validateCode
     * @throws ServiceException
     * @throws ParseException
     */
    public void processActivate(String email, String validateCode) throws ServiceException, ParseException;

    /**
     *
     * @param member
     * @return
     */
//    public boolean register(Member member);

    /**
     *
     * @param email
     * @param password
     * @return
     */
    public boolean login(String email, String password);

    /**
     * get all infomation of a member
     * @param memberId
     * @return
     */
    public Member getProfile(int memberId);

    /**
     *
     * @param email
     * @return
     */
    public Member getProfileByEmail(String email);

    /**
     * update profile
     * @param member
     * @return
     */
    public boolean updateProfile(Member member);

    /**
     * cancel the member's qualification
     * delete the member
     * @param member
     * @return
     */
    public boolean deleteMember(Member member);

    /**
     * accumulation the sum of money paid by the member on the website
     * @param memberId
     * @param money
     * @return
     */
    public boolean consumptionsUp(int memberId, double money);

    /**
     * raise the member's level according to his consumptions
     * @param memberId
     * @return
     */
    public boolean levelUp(int memberId);

    /**
     *
     * @param consumptions
     * @return
     */
    public int level(double consumptions);

    /**
     *
     * @param level
     * @return
     */
    public double discount(int level);


}
