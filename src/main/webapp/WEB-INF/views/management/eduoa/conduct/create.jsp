<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include.inc.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        var navClose = function(json) {
            $("#button_close", $("#purchaseModel")).trigger("click");
            dialogReloadNavTabAfterCloseTab(json);
        };
        //提交按钮
        $("#button_submit").on('click', function(event){
            $("#purchaseModel").prop("action", '${contextPath }/management/eduoa/conduct/submit');
            return validateCallback($("#purchaseModel"), navClose);
        });
        //保存按钮
        $("#button_save").on('click', function(event){
            $("#purchaseModel").prop("action", '${contextPath }/management/eduoa/conduct/save');
            return validateCallback($("#purchaseModel"), navClose);
        });

        $("#leaderName").on('click', function(event) {
            $("#leaderName_select").trigger("click");
        });

        if ($.validator) {
            $.validator.addMethod("totalValid", function(value, element, params) {
                try{
                    return eval('(' + params + ')');
                }catch(e){
                    return false;
                }
            }, "领取数量大于剩余数量！");
        }
    });
    function doTotal(element) {
        var purchaseConduct_goodsUnitPrice = $("#purchaseConduct_goodsUnitPrice").val();
        var purchaseConduct_goodsCount = $("#purchaseConduct_goodsCount").val();
        var priceSum = parseFloat(purchaseConduct_goodsUnitPrice) * parseFloat(purchaseConduct_goodsCount);
        $("#purchaseConduct_priceSum").val(priceSum);
        return true;
    }
</script>
<div class="pageContent">
    <form id="purchaseModel" method="post" action="#" class="required-validate pageForm">
        <div class="pageFormContent" style="height: 228px; overflow: auto;" layouth="56">
            <p>
                <label>采购人：</label>
                <input type="hidden" name="purchaseConduct.conductTeacherId" readonly="true" value="${user.id}" size="32" maxlength="32"/>
                <input type="text" name="purchaseConduct.conductTeacherName" readonly="true" value="${user.teacherName}" readonly="true" class="required" size="32" maxlength="20"/>
            </p>

            <p>
                <label>采购部门：</label>
                <input type="hidden" name="purchaseConduct.conductOrganizationId" value="${organization.id}" class="required" size="30"/>
                <input type="text" name="purchaseConduct.conductOrganizationName" readonly="true" value="${organization.name}" class="required" size="30"/>
            </p>

            <p>
                <label>采购时间：</label>
                <input type="text" name="purchaseConduct.createTime"
                       value="<fmt:formatDate value="${createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                       dateFmt="yyyy-MM-dd HH:mm:ss" class="required date" size="30"/><a class="inputDateButton"
                                                                                        href="javascript:;">选择</a>
            </p>

            <p>
                <label>审批人：</label>
                <input type="hidden" name="leader.leaderId" size="32" maxlength="32"/>
                <input type="hidden" name="leader.leaderPosition" size="32" maxlength="32"/>
                <input type="text" name="leader.leaderName" id="leaderName" readonly="true" class="required" size="32" maxlength="20"/>
                <a id="leaderName_select" class="btnLook" target="dialog" width="530" mask="true" height="450"
                   href="${contextPath }/management/eduoa/teacher/leader"
                   lookupGroup="leader" title="选择">选择</a>
            </p>

            <div class="divider"></div>
            <p>
                <label>物品：</label>
                <input type="hidden" name="purchaseConduct.purchaseId" value="${purchaseConduct.purchaseId}"  size="32" maxlength="32"/>
                <input type="hidden" name="purchaseConduct.goodsId" value="${purchaseConduct.goodsId}" size="32" maxlength="32"/>
                <input type="text" name="purchaseConduct.goodsName" value="${purchaseConduct.goodsName}" readonly="true" class="required" size="32" maxlength="32"/>
            </p>
            <p>
                <label>单位：</label>
                <input type="text" name="purchaseConduct.goodsUnit" value="${purchaseConduct.goodsUnit}" readonly="true" class="required" size="32" maxlength="20"/>
            </p>
            <p>
                <label>单价：</label>
                <input type="text" id="purchaseConduct_goodsUnitPrice" name="purchaseConduct.goodsUnitPrice"
                       totalValid="doTotal()" class="required number" size="32" maxlength="20"/>元
            </p>
            <p>
                <label>数量：</label>
                <input type="text" id="purchaseConduct_goodsCount" name="purchaseConduct.goodsCount" totalValid="doTotal()" class="required digits" size="32" maxlength="20"/>
            </p>

            <div class="divider"></div>

            <dl class="nowrap">
                <dt>合计款项：</dt>
                <dd>
                    <input type="text" id="purchaseConduct_priceSum" name="purchaseConduct.priceSum"
                           readonly="true" class="required number" size="32" maxlength="20"/>元
                </dd>
            </dl>
        </div>

        <div class="formBar">
            <ul>
                <li>
                    <div class="button">
                        <div class="buttonContent">
                            <button type="button" id="button_submit">提交</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <div class="buttonContent">
                            <button type="button" id="button_save">保存</button>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="button">
                        <div class="buttonContent">
                            <button type="button" id="button_close" class="close">关闭</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</div>