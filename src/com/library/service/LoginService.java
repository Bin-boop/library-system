package com.library.service;

import com.library.bean.ReaderCard;
import com.library.dao.AdminDao;
import com.library.dao.ReaderCardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.rmi.runtime.Log;

@Service
public class LoginService {

    @Autowired
    private ReaderCardDao readerCardDao;
    @Autowired
    private AdminDao adminDao;

    public boolean hasMatchReader(String  username,String password){
        return  readerCardDao.getIdMatchCount(username, password)>0;
    }

    public Long getAdminUsername(String username) {
        return adminDao.getUsername(username);
    }

    public ReaderCard findReaderCardByReaderId(String username){
        return readerCardDao.findReaderByReaderId(username);
    }

    public boolean hasMatchAdmin(String username,String password){
        return adminDao.getMatchCount(username, password) == 1;
    }

    public boolean adminRePassword(long adminId, String newPassword){
        return adminDao.resetPassword(adminId,newPassword)>0;
    }
    public String getAdminPassword(long adminId){
        return adminDao.getPassword(adminId);
    }

    public boolean readerRePassword(long readerId, String newPassword) {
        return readerCardDao.resetPassword(readerId, newPassword) > 0;
    }

    public String getReaderPassword(long readerId) {
        return readerCardDao.getPassword(readerId);
    }


}
