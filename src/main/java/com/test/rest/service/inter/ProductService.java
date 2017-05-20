package com.test.rest.service.inter;

/**
 * Created by jamesche on 2017/5/19.
 */

import com.test.rest.service.Product;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;
import java.util.Map;

public interface ProductService {

    @GET
    @Path("/products")
    @Produces(MediaType.APPLICATION_JSON)
    List<Product> retrieveAllProducts();

    @GET
    @Path("/product/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    Product retrieveProductById(@PathParam("id")long id);

    /**
     * 参数查询
     * @param name
     * @return
     */
    @GET
    @Path("/products/name")
    @Produces(MediaType.APPLICATION_JSON)
    List<Product> retrieveProductsByName_param(@QueryParam("name")String name);

    /**
     * 提交表单查询
     * @param name
     * @return
     */
    @POST
    @Path("/products/form/name")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    List<Product> retrieveProductsByName_form(@FormParam("name")String name);


    @POST
    @Path("/product")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    Product createProduct(Product product);

    @POST
    @Path("/product/create")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    Product createProduct(@FormParam("name")String name,@FormParam("price")double price);

    @PUT
    @Path("/product/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    Product updateProductById(@PathParam("id")long id,Map<String,Object> fieldMap);

    @PUT
    @Path("/product")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    Product updateProduct(Product product);

    @PUT
    @Path("/product/update")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    Product updateProduct(@FormParam("id")long id,@FormParam("name")String name,@FormParam("price")double price);

    @DELETE
    @Path("/product/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    Product deleteProductById(@PathParam("id")long id);

    @DELETE
    @Path("/product")
    @Produces(MediaType.APPLICATION_JSON)
    Product deleteProductById_param(@QueryParam("id")long id);
}
