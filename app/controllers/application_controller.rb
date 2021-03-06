class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def set_params(params)
    if params.split("_").length-1 == 2
      case params.split("_")[1]
        when "newcontents"
          panel_id = params.split("_").last
          admin_panel = Panel.find(panel_id.to_i)
          admin_content = Content.create
          admin_content.contains = admin_panel
          if admin_content.save
            notice_result(params.split("_")[1], "notice_success")
            redirect_to edit_admin_content_path(admin_content)
          else
            notice_result(params.split("_")[1], "notice_failure")
            respond_with(admin_panel, :location => admin_panels_url)
          end
        when "newcategoryalls"
          panel_id = params.split("_").last
          admin_panel = Panel.find(panel_id.to_i)
          admin_categoryall = admin_panel.categoryalls.new
          if admin_categoryall.save 
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to edit_admin_categoryall_path(admin_categoryall)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_failure")
            respond_with(admin_panel, :location => admin_panels_url)
          end
        when "reacontents"
          flash[:notice] = notice_result(params.split("_")[1], "notice_success")
          content_id = params.split("_").last 
          admin_content = Content.find(content_id)   
          redirect_to edit_admin_content_path(admin_content) 
        when "reacategoryalls" 
          flash[:notice] = notice_result(params.split("_")[1], "notice_success")
          categoryall_id = params.split("_").last
          admin_categoryall = Categoryall.find(categoryall_id)
          redirect_to edit_admin_categoryall_path(admin_categoryall)
        when "reaproducts"
          flash[:notice] = notice_result(params.split("_")[1], 'notice_success')
          product_id = params.split("_").last
          admin_product = Product.find(product_id)
          redirect_to edit_admin_product_path(admin_product) 
        when "desproducts"
          flash[:notice] = notice_result(params.split("_")[1], 'notice_success')
          product_id = params.split("_").last
          admin_product = Product.find(product_id)
          admin_categoryall = admin_product.categoryall
          if admin_product.destroy
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to admin_categoryall.products.empty? ? edit_admin_categoryall_path(admin_categoryall) : edit_admin_product_path(admin_categoryall.products.first)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to(:back)
          end 
        when "descategoryalls"
          categoryall_id = params.split("_").last
          admin_categoryall = Categoryall.find(categoryall_id)
          admin_panel = admin_categoryall.panel
          if admin_categoryall.destroy
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to admin_panel.categoryalls.empty? ? edit_admin_panel_path(admin_panel) : edit_admin_categoryall_path(admin_panel.categoryalls.first)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_failure") 
            redirect_to(:back)
          end
        when "descontents"
          content_id = params.split("_").last
          admin_content = Content.find(content_id)
          admin_panel = admin_content.panel
          if admin_content.destroy
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to admin_panel.contents.empty? ? edit_admin_panel_path(admin_panel) : edit_admin_content_path(admin_panel.contents.first)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_failure")
            redirect_to(:back)
          end
        when "desproducts"
          product_id = params.split("_").last
          admin_product = Product.find(product_id)
          admin_categoryall = admin_product.categoryall
          if admin_categoryall.destroy
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to admin_categoryall.products.empty? ? edit_admin_categoryall_path(admin_categoryall) : edit_admin_product_path(admin_product)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_failure")
            redirect_to(:back)
          end
        when "newtitleproducts"
          product_id = params.split("_").last
          admin_pruduct = Product.find(product_id)
          admin_titleproduct = Titleproduct.new(:product_id => product_id)
          if admin_titleproduct.save
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to edit_admin_titleproduct_path(admin_titleproduct)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_failure")
            redirect_to edit_admin_product_path(admin_product)
          end
        when "newproducts"
          categoryall_id = params.split("_").last
          admin_categoryall = Categoryall.find(categoryall_id)
          admin_product = admin_categoryall.products.new
          if admin_product.save
            flash[:notice] = notice_result(params.split("_")[1], "notice_success")
            redirect_to edit_admin_product_path(admin_product)
          else
            flash[:notice] = notice_result(params.split("_")[1], "notice_failure")
            redirect_to edit_admin_categoryall_path(admin_categoryall)
          end 
        else
          flash[:notice] = notice_result(params.split("_")[1], "notice_success") 
          panel_id = params.split("_").last
          admin_panel = Panel.find(panel_id.to_i)
          respond_with(admin_panel, :location => admin_panels_url)
      end
    end
  end

  def notice_result(params_notice, notification)
    t("admin.#{params_notice.scan(/^.{1,3}(.{1,})$/)[0][0]}.#{hash_value_notice(params_notice.scan(/^(.{1,3}).{1,}$/)[0][0])}.#{notification}")    
  end

  def hash_value_notice(value_notice_to_params)
    hash_value_notice = Hash.new
    hash_value_notice = {"rea" => "update", "update" => "update", "new" => "new", "des" => "destroy"}
    hash_value_notice[value_notice_to_params]
  end
end
