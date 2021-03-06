// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.

package org.rooinaction.coursemanager.client.managed.ui.mobile;
import com.google.gwt.core.client.GWT;
import com.google.gwt.dom.client.Element;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.HasClickHandlers;
import com.google.gwt.i18n.client.DateTimeFormat;
import com.google.gwt.i18n.client.NumberFormat;
import com.google.gwt.uibinder.client.UiBinder;
import com.google.gwt.uibinder.client.UiField;
import com.google.gwt.uibinder.client.UiHandler;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.ui.Composite;
import com.google.gwt.user.client.ui.HTMLPanel;
import com.google.gwt.user.client.ui.Widget;
import org.rooinaction.coursemanager.client.managed.ui.TrainingProgramDetailsView;
import org.rooinaction.coursemanager.web.proxy.TrainingProgramProxy;

public abstract class TrainingProgramMobileDetailsView_Roo_Gwt extends Composite implements TrainingProgramDetailsView {

    @UiField
    Element id;

    @UiField
    Element name;

    @UiField
    Element version;

    TrainingProgramProxy proxy;

    public void setValue(TrainingProgramProxy proxy) {
        this.proxy = proxy;
        id.setInnerText(proxy.getId() == null ? "" : String.valueOf(proxy.getId()));
        name.setInnerText(proxy.getName() == null ? "" : String.valueOf(proxy.getName()));
        version.setInnerText(proxy.getVersion() == null ? "" : String.valueOf(proxy.getVersion()));
    }
}
