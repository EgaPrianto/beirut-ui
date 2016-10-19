//package com.gdn.x.ui.beirut.controller;
//
//import com.gdn.x.payment.service.master.model.PaymentRuleEnum;
//import com.gdn.x.ui.shipping.service.ShippingService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//
//@Controller
//@RequestMapping(value = ShippingViewController.BASE_PATH)
//public class ShippingViewController {
//  public static final String BASE_PATH = "/view";
//  public static final String LOGISTIC_OPTION_SUMMARY_PATH = "/logistic-option-summary";
//  public static final String CREATE_LOGISTIC_OPTION_PATH = "/create-logistic-option";
//  public static final String CREATE_LOGISTIC_PRODUCT_PATH = "/create-logistic-product";
//  public static final String LOGISTIC_OPTION_DETAIL_PATH = "/logistic-option-detail/";
//  public static final String LOGISTIC_PRODUCT_DETAIL_PATH = "/logistic-product-detail/";
//  public static final String LOGISTIC_PRODUCT_SUMMARY_PATH = "/logistic-product-summary";
//  public static final String LOGISTIC_PROVIDER_COUNTER_PATH = "/logistic-provider-counter";
//  public static final String LOGISTIC_PROVIDER_REPORT_LOG_PATH = "/logistic-provider-report-log";
//  public static final String LOGISTIC_UPLOAD_DATA_STATUS_PATH = "/logistic-upload-data-status";
//  public static final String UPDATE_LOGISTIC_OPTION_PATH = "/update-logistic-option/";
//  public static final String UPDATE_LOGISTIC_PRODUCT_PATH = "/update-logistic-product/";
//  public static final String UPLOAD_SHIPPING_PATH = "/upload-shipping";
//  public static final String CATEGORY_SETTINGS = "/category-settings";
//
//  @Autowired
//  private ShippingService shippingService;
//
//  @RequestMapping(value = ShippingViewController.CATEGORY_SETTINGS, method = RequestMethod.GET)
//  public String getCategorySettingsView() {
//    return "category-settings";
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_OPTION_SUMMARY_PATH,
//      method = RequestMethod.GET)
//  public String getCenterSummaryView() {
//    return "logistic-option-summary";
//  }
//
//  @RequestMapping(value = ShippingViewController.CREATE_LOGISTIC_OPTION_PATH,
//      method = RequestMethod.GET)
//  public ModelAndView getCreateLogisticOptionView() {
//    ModelAndView mav = new ModelAndView("logistic-option-form");
//    mav.addObject("operation", "insert");
//    return mav;
//  }
//
//  @RequestMapping(value = ShippingViewController.CREATE_LOGISTIC_PRODUCT_PATH,
//      method = RequestMethod.GET)
//  public ModelAndView getCreateLogisticProductView() {
//    ModelAndView mav = new ModelAndView("logistic-product-form");
//    mav.addObject("operation", "insert");
//    mav.addObject("paymentRuleEnum", PaymentRuleEnum.values());
//    return mav;
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_OPTION_DETAIL_PATH
//      + "{logisticOptionCode}", method = RequestMethod.GET)
//  public ModelAndView getLogisticOptionDetailView(@PathVariable String logisticOptionCode) {
//    ModelAndView mav = new ModelAndView("logistic-option-form");
//    mav.addObject("operation", "view");
//    mav.addObject("logisticOptionCode", logisticOptionCode);
//    return mav;
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_PRODUCT_DETAIL_PATH
//      + "{logisticProductCode}", method = RequestMethod.GET)
//  public ModelAndView getLogisticProductDetailView(@PathVariable String logisticProductCode) {
//    ModelAndView mav = new ModelAndView("logistic-product-form");
//    mav.addObject("operation", "view");
//    mav.addObject("logisticProductCode", logisticProductCode);
//    return mav;
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_PRODUCT_SUMMARY_PATH,
//      method = RequestMethod.GET)
//  public String getLogisticProductSummaryView() {
//    return "logistic-product-summary";
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_PROVIDER_COUNTER_PATH,
//      method = RequestMethod.GET)
//  public String getLogisticProviderCounterView() {
//    return "logistic-provider-counter";
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_PROVIDER_REPORT_LOG_PATH,
//      method = RequestMethod.GET)
//  public String getLogisticProviderReportLogView() {
//    return "logistic-provider-report-log";
//  }
//
//  @RequestMapping(value = ShippingViewController.LOGISTIC_UPLOAD_DATA_STATUS_PATH,
//      method = RequestMethod.GET)
//  public String getLogisticUploadDataStatusView() {
//    return "logistic-upload-data-status";
//  }
//
//  @RequestMapping(value = ShippingViewController.UPDATE_LOGISTIC_OPTION_PATH
//      + "{logisticOptionCode}", method = RequestMethod.GET)
//  public ModelAndView getUpdateLogisticOptionView(@PathVariable String logisticOptionCode) {
//    ModelAndView mav = new ModelAndView("logistic-option-form");
//    mav.addObject("operation", "update");
//    mav.addObject("logisticOptionCode", logisticOptionCode);
//    return mav;
//  }
//
//  @RequestMapping(value = ShippingViewController.UPDATE_LOGISTIC_PRODUCT_PATH
//      + "{logisticProductCode}", method = RequestMethod.GET)
//  public ModelAndView getUpdateLogisticProductView(@PathVariable String logisticProductCode) {
//    ModelAndView mav = new ModelAndView("logistic-product-form");
//    mav.addObject("operation", "update");
//    mav.addObject("logisticProductCode", logisticProductCode);
//    return mav;
//  }
//
//  @RequestMapping(value = ShippingViewController.UPLOAD_SHIPPING_PATH, method = RequestMethod.GET)
//  public String getUploadShippingView() {
//    return "upload-shipping";
//  }
//}
