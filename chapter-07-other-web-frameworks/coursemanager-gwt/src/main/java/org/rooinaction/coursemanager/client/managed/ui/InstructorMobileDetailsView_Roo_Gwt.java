// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.

package org.rooinaction.coursemanager.client.managed.ui;

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
import org.rooinaction.coursemanager.client.scaffold.place.ProxyDetailsView;
import org.rooinaction.coursemanager.web.gwt.proxies.InstructorProxy;

public abstract class InstructorMobileDetailsView_Roo_Gwt extends Composite implements ProxyDetailsView<InstructorProxy> {

    @UiField
    Element id;

    @UiField
    Element fullName;

    @UiField
    Element firstName;

    @UiField
    Element middleNameOrInitial;

    @UiField
    Element lastName;

    @UiField
    Element addressLine1;

    @UiField
    Element addressLine2;

    @UiField
    Element city;

    @UiField
    Element stateCode;

    @UiField
    Element postalCode;

    @UiField
    Element emailAddress;

    @UiField
    Element version;

    @UiField
    Element taxNumber;

    InstructorProxy proxy;

    public void setValue(InstructorProxy proxy) {
        this.proxy = proxy;
        id.setInnerText(proxy.getId() == null ? "" : String.valueOf(proxy.getId()));
        fullName.setInnerText(proxy.getFullName() == null ? "" : String.valueOf(proxy.getFullName()));
        firstName.setInnerText(proxy.getFirstName() == null ? "" : String.valueOf(proxy.getFirstName()));
        middleNameOrInitial.setInnerText(proxy.getMiddleNameOrInitial() == null ? "" : String.valueOf(proxy.getMiddleNameOrInitial()));
        lastName.setInnerText(proxy.getLastName() == null ? "" : String.valueOf(proxy.getLastName()));
        addressLine1.setInnerText(proxy.getAddressLine1() == null ? "" : String.valueOf(proxy.getAddressLine1()));
        addressLine2.setInnerText(proxy.getAddressLine2() == null ? "" : String.valueOf(proxy.getAddressLine2()));
        city.setInnerText(proxy.getCity() == null ? "" : String.valueOf(proxy.getCity()));
        stateCode.setInnerText(proxy.getStateCode() == null ? "" : String.valueOf(proxy.getStateCode()));
        postalCode.setInnerText(proxy.getPostalCode() == null ? "" : String.valueOf(proxy.getPostalCode()));
        emailAddress.setInnerText(proxy.getEmailAddress() == null ? "" : String.valueOf(proxy.getEmailAddress()));
        version.setInnerText(proxy.getVersion() == null ? "" : String.valueOf(proxy.getVersion()));
        taxNumber.setInnerText(proxy.getTaxNumber() == null ? "" : String.valueOf(proxy.getTaxNumber()));
    }
}