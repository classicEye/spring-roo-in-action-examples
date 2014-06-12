// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.votesecure.domain;

import com.springsource.votesecure.domain.ChoiceDataOnDemand;
import com.springsource.votesecure.domain.Vote;
import com.springsource.votesecure.domain.VoteDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect VoteDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VoteDataOnDemand: @Component;
    
    private Random VoteDataOnDemand.rnd = new SecureRandom();
    
    private List<Vote> VoteDataOnDemand.data;
    
    @Autowired
    ChoiceDataOnDemand VoteDataOnDemand.choiceDataOnDemand;
    
    public Vote VoteDataOnDemand.getNewTransientVote(int index) {
        Vote obj = new Vote();
        setIp(obj, index);
        setRegistered(obj, index);
        return obj;
    }
    
    public void VoteDataOnDemand.setIp(Vote obj, int index) {
        String ip = "ip_" + index;
        obj.setIp(ip);
    }
    
    public void VoteDataOnDemand.setRegistered(Vote obj, int index) {
        Date registered = new Date(new Date().getTime() - 10000000L);
        obj.setRegistered(registered);
    }
    
    public Vote VoteDataOnDemand.getSpecificVote(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Vote obj = data.get(index);
        Long id = obj.getId();
        return Vote.findVote(id);
    }
    
    public Vote VoteDataOnDemand.getRandomVote() {
        init();
        Vote obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Vote.findVote(id);
    }
    
    public boolean VoteDataOnDemand.modifyVote(Vote obj) {
        return false;
    }
    
    public void VoteDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Vote.findVoteEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Vote' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Vote>();
        for (int i = 0; i < 10; i++) {
            Vote obj = getNewTransientVote(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}