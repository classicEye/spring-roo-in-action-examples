// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.model;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.rooinaction.coursemanager.model.TrainingProgram;
import org.rooinaction.coursemanager.model.TrainingProgramDataOnDemand;
import org.rooinaction.coursemanager.model.TrainingProgramIntegrationTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TrainingProgramIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TrainingProgramIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TrainingProgramIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TrainingProgramIntegrationTest: @Transactional;
    
    @Autowired
    TrainingProgramDataOnDemand TrainingProgramIntegrationTest.dod;
    
    @Test
    public void TrainingProgramIntegrationTest.testCountTrainingPrograms() {
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", dod.getRandomTrainingProgram());
        long count = TrainingProgram.countTrainingPrograms();
        Assert.assertTrue("Counter for 'TrainingProgram' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testFindTrainingProgram() {
        TrainingProgram obj = dod.getRandomTrainingProgram();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to provide an identifier", id);
        obj = TrainingProgram.findTrainingProgram(id);
        Assert.assertNotNull("Find method for 'TrainingProgram' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TrainingProgram' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testFindAllTrainingPrograms() {
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", dod.getRandomTrainingProgram());
        long count = TrainingProgram.countTrainingPrograms();
        Assert.assertTrue("Too expensive to perform a find all test for 'TrainingProgram', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TrainingProgram> result = TrainingProgram.findAllTrainingPrograms();
        Assert.assertNotNull("Find all method for 'TrainingProgram' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TrainingProgram' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testFindTrainingProgramEntries() {
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", dod.getRandomTrainingProgram());
        long count = TrainingProgram.countTrainingPrograms();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TrainingProgram> result = TrainingProgram.findTrainingProgramEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TrainingProgram' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TrainingProgram' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testFlush() {
        TrainingProgram obj = dod.getRandomTrainingProgram();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to provide an identifier", id);
        obj = TrainingProgram.findTrainingProgram(id);
        Assert.assertNotNull("Find method for 'TrainingProgram' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTrainingProgram(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'TrainingProgram' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testMergeUpdate() {
        TrainingProgram obj = dod.getRandomTrainingProgram();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to provide an identifier", id);
        obj = TrainingProgram.findTrainingProgram(id);
        boolean modified =  dod.modifyTrainingProgram(obj);
        Integer currentVersion = obj.getVersion();
        TrainingProgram merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'TrainingProgram' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", dod.getRandomTrainingProgram());
        TrainingProgram obj = dod.getNewTransientTrainingProgram(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TrainingProgram' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'TrainingProgram' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TrainingProgramIntegrationTest.testRemove() {
        TrainingProgram obj = dod.getRandomTrainingProgram();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TrainingProgram' failed to provide an identifier", id);
        obj = TrainingProgram.findTrainingProgram(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TrainingProgram' with identifier '" + id + "'", TrainingProgram.findTrainingProgram(id));
    }
    
}
