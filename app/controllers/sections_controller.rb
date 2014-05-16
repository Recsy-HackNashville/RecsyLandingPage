class SectionsController < ApplicationController
    def create
        section_type_id = params[:section_type_id]
        section_type = SectionType.where(id: params[:section_type_id]).first
        if section_type
            section = Section.new(
               section_type_id: section_type.id,
               user_id: current_user.id
            )
            if section.save
                flash[:notice] = "Section added!!"
            else
                flash[:alert] = "Section could not be added :*("
            end
        else
            flash[:alert] = "Not a valid section type"
        end
        redirect_to controller: :builder, action: :index
    end

    def update
        section_id = params[:id]

        # Pull any keys that start with "section_"
        input_items = { }
        params.each do |key, val|
            next if not key.start_with? 'section_'
            tokens = key.split('_', 4)
            puts tokens.to_yaml
            item = {
                type: tokens[1],
                id: tokens[2],
                field: tokens[3]
            }
            input_items[item[:type]] ||= { }
            input_items[item[:type]][item[:id]] ||= { }
            input_items[item[:type]][item[:id]][item[:field]] = val
        end

        input_items.each do |type, item| 
            klass = "Section#{type.capitalize}Item".constantize
            item.each do |id, item2|
                puts '[INFO] previewing id'
                puts id.to_i.inspect
                instance = klass.send(:where, id: id.to_i).first
                item2.each do |field, val|
                    instance[field] = val
                end
                instance.save
            end
        end
        redirect_to controller: :builder, action: :index
    end

    def delete

    end
end
