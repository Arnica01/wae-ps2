class QuotationController < ApplicationController


  def quotations
    if params[:quotation]
      @quotation = Basic.new(params.require(:quotation).permit(:author_name, :category, :quote))

      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Basic.new

      end
    else
      @quotation = Basic.new
    end
    if params[:sort_by] == "date"
      @quotations = Basic.order(:created_at)
    else
      @quotations = Basic.order(:category)
    end


<h3>Quotations</h3>

<div align="right">
<%= form_tag(basics_quotations_path  method: :get) do %>
  Search Quotes <%= text_field_tag params[:qoute] %>
  <%= submit_tag 'Search' , name: nil%>
<% end %>
</div>





<ul>
  <% for quotation in @quotations %>
    <li><%= h quotation.author_name %>: <%= h quotation.quote %></li>
  <% end %>
</ul>
<br/>
<% if params[:sort_by] == "date" %>
  <%= link_to "Sort by category", :action => :quotations, :sort_by => :category %>
<% else %>
  <%= link_to "Sort by date", :action => :quotations, :sort_by => :date %>
<% end %>
<hr/>

<h3>New quotation</h3>
<%= form_for @quotation, :url => { :action => :quotations } do |form| %>

    <legend>Enter details</legend>
    <div class="form_row">
      <%= form.label :author_name %>
      <%= form.text_field :author_name, :size => 20, :maxlength => 40 %>
    </div>
    <div class="form_row">
      <%= form.label :category %>
      <%= form.text_field :category, :size => 20, :maxlength => 40 %>
    </div>
    <div class="form_row">
      <%= form.label :quote %>
      <%= form.text_area :quote, :rows => 2, :cols => 40, :maxlength => 500 %>
    </div>

  <p>
  <div class="form_row">
    <%= form.submit 'Create' %>
  </div>
  </p>
<% end %>


    


  end

end
