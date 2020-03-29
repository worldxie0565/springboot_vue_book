<template>
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="编号" style="width: 60%" >
      <el-input readonly v-model="ruleForm.id"></el-input>
    </el-form-item>
    <el-form-item label="图书名称" prop="name" style="width: 60%">
      <el-input v-model="ruleForm.name"></el-input>
    </el-form-item>
    <el-form-item label="作者" prop="author" style="width: 60%">
      <el-input v-model="ruleForm.author"></el-input>
    </el-form-item>
    <el-form-item style="text-align: left">
      <el-button type="primary" @click="submitForm('ruleForm')">修改</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
    export default {
        data() {
            return {
                ruleForm: {
                    id: '',
                    name: '',
                    author: ''
                },
                rules: {
                    name: [
                        { required: true, message: '请输入图书名称', trigger: 'blur' },
                    ],
                    author: [
                        { required: true, message: '请输入作者', trigger: 'blur' },
                    ]
                }
            };
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        axios.put("http://localhost:8081/book/update", this.ruleForm).then(resp => {
                            if(resp.data == "success"){
                                // this.$message("图书添加成功")
                                this.$alert('《' + this.ruleForm.name + '》' + '修改成功', '消息', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$router.push("/page1")
                                    }
                                });
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields()
            }
        },
        created(){
          axios.get("http://localhost:8081/book/findById/"+this.$route.query.id).then(resp=>{
              this.ruleForm = resp.data
          })
        }
    }
</script>