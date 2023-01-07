const express = require('express');
const adminRouter = express.Router();
const admin = require('../middleware/admin');
const { Product } = require('../models/product');
// Creating an Admin Middleware

//Adding product
adminRouter.post('/admin/add-product', admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;
        let product = new Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product = await product.save();
        // product gets product{} from mongoDB with _id and _version
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})

//Get all the products
//admin/get-products
adminRouter.get('/admin/get-products', admin, async (req, res) => {
    try {
        const products = await Product.find({});
        res.json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//Delete the product
adminRouter.post('/admin/delete-product', admin, async (req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        // product = await product.save();
        //Gives error after deleting that no document of 'id' is found on model 'Product' 
        res.json(product);
        // res.send("All went well, product deleted");
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})

module.exports = adminRouter;