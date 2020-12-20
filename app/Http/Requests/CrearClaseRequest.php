<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CrearClaseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */

     /*
    public function rules()
    {
        return [
            'periodo'=>'required|max:3',
            'materia'=>'required|max:3',
            'responsable'=>'required|max:3',
            'ambiente'=>'required|max:3',
            'day'=>'required|max:1',
            'startTime'=>'required|max:10',
            'endTime'=>'required|max:10',
            'tipo'=>'max:10',
            'nivel'=>'max:10'
        ];
    }
    public function messages(){
        return[
            'periodo.required'=>'Periodo es necesario',
            'materia.required'=>'Se necesita Materia',
            'responsable.required'=>'Se necesita Responsable',
            'ambiente.required'=>'Se necesita ambiente',
            'day.required'=>'Proporcione un dia valido',
            'startTime.required'=>'Proporcione una hora valida',
            'endTime.required'=>'Proporcione una hora valida',
        ]
            
    }
    */
}
