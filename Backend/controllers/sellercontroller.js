


export default class SellerController {
    constructor(sellermgr){
        this.dal=sellermgr

     }
    myproducts = async (req, res)=> {
        let result = [];
        result = await this.dal.myproducts(req);
        res.send(result);
    };

    insert = async (req, res) => {
        let result = [];
        result = await this.dal.insert(req);
        res.send(result);
    };



    remove = async (req, res) => {
        let result = [];
        result = await this.dal.remove(req.params.id)
        res.send(result);
    };
    edit = async (req, res) => {
        let result = [];
        result = await this.dal.edit(req)
        res.send(result);
    };
}