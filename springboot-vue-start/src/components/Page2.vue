<template>
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="图书名称" prop="name" style="width: 60%">
      <el-input v-model="ruleForm.name"></el-input>
    </el-form-item>
    <el-form-item label="作者" prop="author" style="width: 60%">
      <el-input v-model="ruleForm.author"></el-input>
    </el-form-item>
    <el-form-item style="text-align: left">
      <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>
<script>
    export default {
        data() {
            return {
                ruleForm: {
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
                        axios.post("http://localhost:8081/book/save", this.ruleForm).then(resp => {
                            if(resp.data == "success"){
                                // this.$message("图书添加成功")
                                this.$alert('《' + this.ruleForm.name + '》' + '添加成功', '消息', {
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
                this.$refs[formName].resetFields();
            }
        }
    }
</script>