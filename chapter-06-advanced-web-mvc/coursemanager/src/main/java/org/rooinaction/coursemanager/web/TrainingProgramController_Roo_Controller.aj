// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.rooinaction.coursemanager.model.Course;
import org.rooinaction.coursemanager.model.TrainingProgram;
import org.rooinaction.coursemanager.web.TrainingProgramController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect TrainingProgramController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String TrainingProgramController.create(@Valid TrainingProgram trainingProgram, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, trainingProgram);
            return "trainingprograms/create";
        }
        uiModel.asMap().clear();
        trainingProgram.persist();
        return "redirect:/trainingprograms/" + encodeUrlPathSegment(trainingProgram.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String TrainingProgramController.createForm(Model uiModel) {
        populateEditForm(uiModel, new TrainingProgram());
        return "trainingprograms/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String TrainingProgramController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("trainingprogram", TrainingProgram.findTrainingProgram(id));
        uiModel.addAttribute("itemId", id);
        return "trainingprograms/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String TrainingProgramController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("trainingprograms", TrainingProgram.findTrainingProgramEntries(firstResult, sizeNo));
            float nrOfPages = (float) TrainingProgram.countTrainingPrograms() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("trainingprograms", TrainingProgram.findAllTrainingPrograms());
        }
        return "trainingprograms/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String TrainingProgramController.update(@Valid TrainingProgram trainingProgram, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, trainingProgram);
            return "trainingprograms/update";
        }
        uiModel.asMap().clear();
        trainingProgram.merge();
        return "redirect:/trainingprograms/" + encodeUrlPathSegment(trainingProgram.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String TrainingProgramController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, TrainingProgram.findTrainingProgram(id));
        return "trainingprograms/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String TrainingProgramController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        TrainingProgram trainingProgram = TrainingProgram.findTrainingProgram(id);
        trainingProgram.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/trainingprograms";
    }
    
    void TrainingProgramController.populateEditForm(Model uiModel, TrainingProgram trainingProgram) {
        uiModel.addAttribute("trainingProgram", trainingProgram);
        uiModel.addAttribute("courses", Course.findAllCourses());
    }
    
    String TrainingProgramController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}