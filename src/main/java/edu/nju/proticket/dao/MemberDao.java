package edu.nju.proticket.dao;

import edu.nju.proticket.model.Member;

import java.util.List;

public interface MemberDao {

    /**
     *
     * @param email
     * @return true:has registered;false:hasn't registered
     */
//    public boolean hasRegistered(String email);

    /**
     *
     * @param member
     * @return
     */
    public boolean register(Member member);

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
    public Member findUnvalidatedUserByEmail(String email);

    /**
     *
     * @param email
     * @return
     */
    public Member findByEmail(String email);

    /**
     * update profile
     * @param member
     * @return
     */
    public boolean updateProfile(Member member);

    /**
     * cancel the member's qualification
     * delete the member
     * @param memberId
     * @return
     */
//    public boolean deleteMember(int memberId);

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
     * @return
     */
    public List<Member> getMembers();

}
