﻿using System.Web;
using System.Web.Mvc;

namespace FinalProject_PropertyManagement
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
