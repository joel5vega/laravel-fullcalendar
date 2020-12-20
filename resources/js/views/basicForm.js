import React from 'react';
import {Field, Form, Formik, FormikProps} from 'formik';

const MyInput = ({field, form, ...props}) => {
    return <input {...field} {...props} />;
};

const Basic = () => (
    <div>
        <h1>My Form</h1>
        <div>
                
                <Formik
                    initialValues={{ semestre: "",materia:"", nivel: "",tipo:"", ambiente:"",responsable:"" }}
                    onSubmit={(values, { setSubmitting, resetForm }) => {
                        setSubmitting(true);
                        setTimeout(() => {
                            alert(JSON.stringify(values, null, 2));
                        }, 500)
                        resetForm();
                        setSubmitting(false);


                    }}
                    

                    
                >
                    {({ values, errors, touched, handleChange, handleBlur, isSubmitting, handleSubmit }) => (
                        <Form>
                            <div className="input-row">
                                <Field as="select" name="semestre" type="number" >
                                    {this.state.semestres.map(item=>
                                        <option key={item.id} value={item.value}>
                                            {item.nombre}
                                    </option>)}
                                    
                                </Field>
                               
                            </div>
                            
                             
                            
                            
                            <div className="input-row">
                                <label htmlFor="ambiente">Ambiente</label>
                                <select
                                    type="text"
                                    name="ambiente"
                                    id="ambiente"
                                    placeholder="semestre"
                                    onChange={handleChange}
                                    onBlur={handleBlur}
                                    value={values.name}
                                    
                                >
                                {this.state.ambientes.map(item=>
                                        <option key={item.id}>
                                            {item.nombre}
                                    </option>)}
                                </select>
                            </div>

                            <div className="input-row">
                                <label htmlFor="materia">Materia</label>
                                <select
                                    type="text"
                                    name="materia"
                                    id="materia"
                                    placeholder="materia"
                                    onChange={handleChange}
                                    onBlur={handleBlur}
                                    value={values.name}
                                    className={touched.name && errors.name ? "has-error" : null}
                                >
                                {this.state.materias.map(item=>
                                        <option key={item.id}>
                                            {item.nombre}
                                    </option>)}
                                </select>
                            </div>

                            <div className="input-row">
                                <label htmlFor="nivel">Nivel</label>
                                <select
                                    type="text"
                                    name="nivel"
                                    id="nivel"
                                    placeholder="Docencia/Auxiliatura"
                                    onChange={handleChange}
                                    onBlur={handleBlur}
                                    value={values.name}
                                    className={touched.name && errors.name ? "has-error" : null}
                                >
                                
                                        <option >Docencia</option>
                                        <option>Auxiliatura</option>
                                </select>
                            </div>
                            <div className="input-row">
                                <label htmlFor="tipo">Tipo</label>
                                <select
                                    type="text"
                                    name="tipo"
                                    id="tipo"
                                    placeholder="teoria/laboratorio"
                                    onChange={handleChange}
                                    onBlur={handleBlur}
                                    value={values.name}
                                    className={touched.name && errors.name ? "has-error" : null}
                                >
                                
                                        <option >Teoria</option>
                                        <option>Laboratorio</option>
                                </select>
                            </div>

                            <div>
                                <div className="input-row">
                                    <button type="submit" disabled={isSubmitting}>Submit</button>
                                </div>
                            </div>
                            
                            <pre>{JSON.stringify(this.state.choqueAmbiente, null, 2)}</pre>
                            <pre>{JSON.stringify(this.state.choqueSemestre, null, 2)}</pre>
                            <pre>{JSON.stringify(values, null, 2)}</pre>
                        </Form>
                    )}

                </Formik>
            </div>
    </div>
);
export default Basic;