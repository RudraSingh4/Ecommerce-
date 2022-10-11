
export default class AdminController {
    constructor(adminmgr){
        this.dal=adminmgr;

    }
    getAll = async (req, res)=> {
        let result = [];
        result = await this.dal.getAll();
        res.send(result);
    };

    getById = async (req, res) =>{
        let result = [];
        result = await this.dal.getById(req.params.id);
        res.send(result);
    };

    insert = async (req, res) => {
        let result = [];
        result = await this.dal.insert(req);
        res.send(result);
    };

    update = async (req, res) => {
        let result = [];
        result = await this.dal.update(req);
        res.send(result);

    };

    remove = async (req, res) => {
        let result = [];
        result = await this.dal.remove(req.params.id)
        res.send(result);
    };
    postById = async (req, res) => {
        let result = [];
        result = await this.dal.postById(req.params.id)
        res.send(result);
    };
    getAllProducts = async (req, res) => {
        let result = [];
        result = await this.dal.getAllProducts()
        res.send(result);
    };
}