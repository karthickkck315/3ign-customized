//
//  DataController.m
//  System3ign
//
//  Created by sanu on 05/12/12.
//
//

#import "DataController.h"
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequest /ASIFormDataRequest.h"

@implementation DataController
@synthesize pdtObject,productArray,isSameVendor,isProduct;



-(Product *)getProductDetails:(NSString *)urlString{
      
    
    NSLog(@"get product details");
    vendorProductObject=[[Product alloc]init];
    relatedProductObject=[[Product alloc]init];
    
    
//    productDic=[[NSMutableDictionary alloc]init];
//    productArray=[[NSMutableArray alloc]init];
    NSURL *url=[NSURL URLWithString:urlString];
    pdtObject = [[Product alloc]init];

    
//    pdtObject.price=@"20";
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [xmlParser setDelegate:self];
    BOOL success=[xmlParser parse];
    if(success){
                NSLog(@"No Errors");
        
        
    }
        else{
                NSLog(@"Error Error Error!!!");
    }
    
   
    
    NSLog(@"id---> %@",pdtObject.productID);
    NSLog(@"name---> %@",pdtObject.productName);
    NSLog(@"name---> %d",[pdtObject.productName length]);

    NSLog(@"price %@",pdtObject.price);
    NSLog(@"currency %@",pdtObject.Currency);
    NSLog(@"main pic  %@",pdtObject.mainpicURL);
    NSLog(@"pic1  %@",pdtObject.pictureURl);
    NSLog(@"desc %@",pdtObject.productDescription);
    NSLog(@"tac %@",pdtObject.tac);




 
   // NSLog(@"id---> %@",pdtObject.productID);
   // NSLog(@"name---> %@",pdtObject.productName);
     NSLog(@" pic count    %d",[pdtObject.pictureURl count]);
    NSLog(@"vendor array count    %d",[pdtObject.sameVendor count]);
    NSLog(@"relatd array count  %d",[pdtObject.relatedProduct count]);

    Product *exampleProductObj=[pdtObject.sameVendor objectAtIndex:0];
    
    NSLog(@"vendor id%@",exampleProductObj.productID);
    
//    
//    exampleProductObj=(Product *)[pdtObject.relatedProduct objectAtIndex:0];
//
//    NSLog(@"relat id%@",exampleProductObj.productID);
//
    return pdtObject;
    
}

-(void)registeringUserDetails:(NSMutableDictionary *)dic{

    NSLog(@"user Registration");
    
    //Fetching url from Property list
    NSString *path=[[NSBundle mainBundle]pathForResource:@"AppURL" ofType:@"plist"];
    NSDictionary *urlDictionary=[[NSDictionary alloc]initWithContentsOfFile:path];
    NSString *urlString=[urlDictionary valueForKey:@"RegistrationURL"];
    NSLog(@"dic-->%@",dic);
    
    
    
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"url-->%@",urlString);
    
   
    
    //send as post method
        
    //assign the field values
    
//    [dic valueForKey:@"name"];
    
    NSLog(@"name%@",[dic valueForKey:@"name"]);
    NSLog(@"pwd%@",[dic valueForKey:@"password"]);
    NSLog(@"mail%@",[dic valueForKey:@"mail"]);
    NSLog(@"address%@",[dic valueForKey:@"address"]);
//    [request setPostValue:[dic valueForKey:@"name"] forKey:@"username"];
//    [request setPostValue:[dic valueForKey:@"password"] forKey:@"userpassword"];
//    [request setPostValue:[dic valueForKey:@"mail"] forKey:@"email"];
//    [request setPostValue:[dic valueForKey:@"address"] forKey:@"shippingaddress"];
    
//    [request setPostValue:@"sanu" forKey:@"username"];
//    [request setPostValue:@"12345" forKey:@"userpassword"];
//    [request setPostValue:@"saranyacse30@gmail.com" forKey:@"email"];
//    [request setPostValue:@"cbe" forKey:@"shippingaddress"];
    
    
    
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    [request addRequestHeader:@"Content_type" value:@"text/xml; charset=utf-8"];
    
    [request setPostValue:@"sanu" forKey:@"username"];
    [request setPostValue:@"12345" forKey:@"userpassword"];
    [request setPostValue:@"saranyacse30@gmail.com" forKey:@"email"];
    [request setPostValue:@"cbe" forKey:@"shippingaddress"];
    
    
    [request setDelegate:self];
    [request startAsynchronous];
    
    NSLog(@"request post data -->%@",request.postBody);
    
    NSString* newStr =[[NSString alloc] initWithData:request.postBody
                                            encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"request body-->%@",newStr);
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
    NSError *error = [request error];
    NSLog(@"request failed  --> %@",error.localizedDescription);
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{

    NSLog(@"requestFinished");
    NSLog(@"request.responsecode ==%i", request.responseStatusCode);
    NSString* newStr = [[NSString alloc] initWithData:request.responseData
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"request -->%@", newStr);
    
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:request.responseData];
    [xmlparser setDelegate:self];
    BOOL success = [xmlparser parse];
    if(success){
        NSLog(@"No Errors");
    }
    else{
        NSLog(@"Error in parsing xml!!!");
    }
    
}

    
    

    




        






-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
    
    NSLog(@"<%@>", elementName);
    currentElement=elementName;
     NSLog(@"<current element  %@>", elementName);
    
    
    if ([currentElement isEqualToString:@"greenare3ign"]){
        NSLog(@"isGreenare3ign-->%d",isGreenare3ign?YES:NO);
        isGreenare3ign=YES;
        NSLog(@"isGreenare3ign-->%d",isGreenare3ign?YES:NO);
        
    }
    
    
    if ([currentElement isEqualToString:@"sameVendor"]){
        isSameVendor=YES;
         NSLog(@"isSameVendor-->%d",isSameVendor?YES:NO);
    
    }
    
    if ([currentElement isEqualToString:@"related"]){
        isRelated=YES;
         NSLog(@"isrelate-->%d",isRelated?YES:NO);
    }

    if ([currentElement isEqualToString:@"product"]){
        
        
         if(isSameVendor){
            isProduct=YES;
             NSLog(@"isProduct-->%d",isProduct?YES:NO);
            
        }else if(isRelated){
            isProduct=YES;
            NSLog(@"isProduct-->%d",isProduct?YES:NO);
        }if (isGreenare3ign){
            isMainProduct=YES;
            //isGreenare3ign=NO;
            NSLog(@"isMainProduct-->%d",isMainProduct?YES:NO);
            NSLog(@"isGreenare3ign-->%d",isGreenare3ign?YES:NO);
            
        }
    }
    if ([currentElement isEqualToString:@"desc"]){
        isdescription=YES;
    }
    if ([currentElement isEqualToString:@"tac"]){
        isTac=YES;
    }

}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    NSLog(@"value%@",string);
        
    if(isSameVendor&&isProduct)
{
         NSLog(@"is same vendor-->%d",isSameVendor?YES:NO);
        NSLog(@"is product vendor-->%d",isProduct?YES:NO);
        NSLog(@"same vendor product");
        if ([currentElement isEqualToString:@"id"])
        {
            vendorProductObject.productID=string;
            
            NSLog(@"vendor pid %@",vendorProductObject.productID);
            
            
        }
        if ([currentElement isEqualToString:@"name"]) {
            vendorProductObject.productName=string;
            NSLog(@"vendor pname %@",vendorProductObject.productName);
        }
        if ([currentElement isEqualToString:@"price"]) {
                vendorProductObject.price=string;
            NSLog(@"vendor price %@",vendorProductObject.price);
        }

        if ([currentElement isEqualToString:@"mainpic"]) {
            vendorProductObject.mainpicURL=string;
            NSLog(@"vendor main pic  %@",vendorProductObject.mainpicURL);
        }
     

    } else if(isRelated && isProduct){
        NSLog(@"related product");
        NSLog(@"is  related-->%d",isRelated?YES:NO);
        NSLog(@"is product vendor-->%d",isProduct?YES:NO);
    
        if ([currentElement isEqualToString:@"id"])
        {
            relatedProductObject.productID=string;
            NSLog(@"related pid %@",relatedProductObject.productID);
            
        }
        if ([currentElement isEqualToString:@"name"]) {
            relatedProductObject.productName=string;
             NSLog(@"related pname %@",relatedProductObject.productName);
        }
        if ([currentElement isEqualToString:@"price"]) {
            relatedProductObject.price=string;
             NSLog(@"related price %@",relatedProductObject.price);
        }

        if ([currentElement isEqualToString:@"mainpic"]) {
            relatedProductObject.mainpicURL=string;
             NSLog(@"related main pic %@",relatedProductObject.mainpicURL);
        }


   
    }else if(isMainProduct){
        NSLog(@"main product");
        NSLog(@"is  main-->%d",isMainProduct?YES:NO);
             
        if ([currentElement isEqualToString:@"id"])
        {
            pdtObject.productID=string;
             NSLog(@"main product pid %@",pdtObject.productID);
        }
        if ([currentElement isEqualToString:@"name"]) {
           pdtObject.productName=string;
            NSLog(@"main product pname %@",pdtObject.productName);
        }
        if ([currentElement isEqualToString:@"price"]) {
           pdtObject.price=string;
            NSLog(@"main product price %@",pdtObject.price);
        }
        if ([currentElement isEqualToString:@"currency"]) {
            pdtObject.Currency=string;
        }
        if ([currentElement isEqualToString:@"mainpic"]) {
            pdtObject.mainpicURL=string;
            NSLog(@"main product main pic  %@",pdtObject.mainpicURL);
        }
        if ([currentElement isEqualToString:@"pic1"]) {
            
           
            pdtObject.pictureURl=[[NSMutableArray alloc]init];
            [pdtObject.pictureURl addObject:string];
           // NSLog(@"main product picurl %@",pdtObject.pictureURl);
        }
        if ([currentElement isEqualToString:@"pic2"]) {
            [pdtObject.pictureURl addObject:string];
           // NSLog(@"main product picurl %@",pdtObject.pictureURl);
        }
        if ([currentElement isEqualToString:@"pic3"]) {
            [pdtObject.pictureURl addObject:string];
        }
        if ([currentElement isEqualToString:@"pic4"]) {
            [pdtObject.pictureURl addObject:string];
            
        }
        if ([currentElement isEqualToString:@"pic5"]) {
            [pdtObject.pictureURl addObject:string];
        }
       
        if (isdescription) {
            
       
        
        //if ([currentElement isEqualToString:@"desc"]) {
            
           
            
            
           if ([pdtObject.productDescription length]==0) {
                NSLog(@" desc length  %d",[pdtObject.productDescription length]);
                pdtObject.productDescription=string;
               
              
            }else{
            
            NSString *tempStr=pdtObject.productDescription;
            NSLog(@" desc length  %d",[pdtObject.productDescription length]);

            NSLog(@"temp str %@",tempStr);
               //pdtObject.productDescription=tempStr;
            
            pdtObject.productDescription=[tempStr stringByAppendingString:string];
               NSLog(@"desc %@",pdtObject.productDescription);
          //  }
            NSLog(@"product desc %@",pdtObject.productDescription);
            
        }
            
        }

if (isTac) {
    
    
    
    //if ([currentElement isEqualToString:@"desc"]) {
    
    
    
    
    if ([pdtObject.tac length]==0) {
        NSLog(@" tac length  %d",[pdtObject.tac length]);
        pdtObject.tac=string;
        
        
    }else{
        
        NSString *tempStr=pdtObject.tac;
        NSLog(@" tac length  %d",[pdtObject.tac length]);
        
        NSLog(@"temp str %@",tempStr);
        //pdtObject.productDescription=tempStr;
        
        pdtObject.tac=[tempStr stringByAppendingString:string];
        NSLog(@"tac %@",pdtObject.tac);
        //  }
        NSLog(@"tac %@",pdtObject.tac);
        
    }

        
}
     
     
    }

    currentElement=Nil;
    

      
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    NSLog(@"</%@>", elementName);
       
    
    
        if (isSameVendor && [elementName isEqualToString:@"product"]) {
            NSLog(@"is same vendor-->%d",isSameVendor?YES:NO);
            NSLog(@"is product vendor-->%d",isProduct?YES:NO);
            pdtObject.sameVendor=[[NSMutableArray alloc]init];
            
            [pdtObject.sameVendor addObject:vendorProductObject];
            
                        
            NSLog(@"vendor product%@",vendorProductObject.productID);
             NSLog(@"vendor product%@",vendorProductObject.productName);
             NSLog(@"vendor product%@",vendorProductObject.price);
             NSLog(@"vendor product%@",vendorProductObject.mainpicURL);
            isProduct=NO;
            
            NSLog(@"is same vendor-->%d",isSameVendor?YES:NO);
            NSLog(@"is product vendor-->%d",isProduct?YES:NO);

    
        }else if(isRelated &&[elementName isEqualToString:@"product"]){
            pdtObject.relatedProduct=[[NSMutableArray alloc]init];
            NSLog(@"is  related-->%d",isRelated?YES:NO);
            NSLog(@"is product vendor-->%d",isProduct?YES:NO);
            
           [pdtObject.relatedProduct addObject:relatedProductObject];
            NSLog(@"related product%@",pdtObject.relatedProduct);
            isProduct=NO;
            NSLog(@"is  related-->%d",isRelated?YES:NO);
            NSLog(@"is product vendor-->%d",isProduct?YES:NO);

        
        }else if([elementName isEqualToString:@"product"]){
            
       
            isMainProduct=NO;
             NSLog(@"is main product-->%d",isMainProduct?YES:NO);
        }
    
    
    
    if ([elementName isEqualToString:@"sameVendor"]) {
         isSameVendor=NO;
        
         NSLog(@"is same vendor-->%d",isSameVendor?YES:NO);
     }
    
    
    
    if ([elementName isEqualToString:@"related"]) {
        isRelated=NO;
        NSLog(@"is related vendor-->%d",isRelated?YES:NO);


    }
    
   
}




@end
