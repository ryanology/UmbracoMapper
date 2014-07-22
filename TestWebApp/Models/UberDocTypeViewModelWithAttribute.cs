﻿namespace TestWebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using Zone.UmbracoMapper;
    
    public class UberDocTypeViewModelWithAttribute
    {
        public UberDocTypeViewModelWithAttribute()
        {
            Comments = new List<CommentViewModelWithAttribute>();
            Countries = new List<CountryViewModel>();
            RelatedLinks = new List<LinkViewModel>();
            CollectionFromXml = new List<NamedItemViewModel>();
            CollectionFromDictionary = new List<NamedItemViewModel>();
            CollectionFromJson = new List<NamedItemViewModel>();
            SubModel = new SubModel();
        }

        public int Id { get; set; }

        public string Heading { get; set; }

        [PropertyMapping(SourceProperty = "CreateDate")]
        public DateTime CreatedOn { get; set; }

        public IHtmlString BodyText { get; set; }
        
        public int StarRating { get; set; }

        public bool IsApproved { get; set; }

        public decimal AverageScore { get; set; }

        public MediaFile MainImage { get; set; }

        public string SingleValueFromXml { get; set; }

        public string SingleValueFromDictionary { get; set; }

        public string SingleValueFromJson { get; set; }

        public IList<CommentViewModelWithAttribute> Comments { get; set; }

        public IList<CountryViewModel> Countries { get; set; }

        public IList<LinkViewModel> RelatedLinks { get; set; }

        public IList<NamedItemViewModel> CollectionFromXml { get; set; }

        public IList<NamedItemViewModel> CollectionFromDictionary { get; set; }

        public IList<NamedItemViewModel> CollectionFromJson { get; set; }

        public SubModel SubModel { get; set; }

        [PropertyMapping(SourceRelatedProperty = "text")]
        public string SelectedComment { get; set; }

        [PropertyMapping(SourceProperty = "selectedComment", SourceRelatedProperty = "Id")]
        public int SelectedCommentId { get; set; }

        [PropertyMapping(SourcePropertiesForConcatenation = new string[] { "heading", "starRating", "Id", "Url" }, ConcatenationSeperator = ", ")]
        public string ConcatenatedValue { get; set; }

        public string ConditionalValueMet { get; set; }

        public string ConditionalValueNotMet { get; set; }

        [PropertyMapping(SourcePropertiesForCoalescing = new string[] { "emptyField", "Name" })]
        public string CoalescedValue { get; set; }
    }
}