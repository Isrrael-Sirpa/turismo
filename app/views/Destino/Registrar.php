<div class="form_contenedor" id="registrarDestino" data-container="registrarDestino" data-entidad="Destino">
    <div class="contenido">
        <h2>Registro Destino</h2>
        <form action="destino/registrar" method="POST" id="uploadForm" class="w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="nombre">Nombre del Destino</label>
                            <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ej. Coroico" required />
                        </div>

                        <div class="form-group">
                            <label for="descripcion">Descripción</label>
                            <textarea name="descripcion" class="form-control" id="descripcion" placeholder="Descripción del destino" rows="2" required></textarea>
                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-4">
                                <label for="departamento">Departamento</label>
                                <select class="form-control" name="departamento" id="departamento">
                                    <option value="LA PAZ">LA PAZ</option>
                                    <option value="SANTA CRUZ">SANTA CRUZ</option>
                                    <option value="BENI">BENI</option>
                                    <option value="CHUQUISACA">CHUQUISACA</option>
                                    <option value="COCHABAMBA">COCHABAMBA</option>
                                    <option value="ORURO">ORURO</option>
                                    <option value="PANDO">PANDO</option>
                                    <option value="POTOSI">POTOSI</option>
                                    <option value="TARIJA">TARIJA</option>
                                </select>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="ubicacion">Ubicación</label>
                                <input type="text" name="ubicacion" class="form-control" id="ubicacion" placeholder="Dirección o ubicación específica" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="clima">Clima</label>
                                <select class="form-control" name="clima" id="clima">
                                    <option value="CALIDO">Calido</option>
                                    <option value="FRIO">Frio</option>
                                    <option value="TEMPLADO">Templado</option>
                                    <option value="HUMEDO">Humedo</option>
                                    <option value="SECO">Seco</option>
                                </select>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="temporada_recomendada">Temporada Recomendada</label>
                                <input type="text" name="temporada_recomendada" class="form-control" id="temporada" placeholder="Ej. Abril - Octubre" />
                            </div>

                            <div class="form-group col-md-6">
                                <label for="coordenadas">Lick Google Maps</label>
                                <input type="text" name="coordenadas" class="form-control" id="coordenadas" placeholder="Peque el enlace" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="atracciones">Atracciones</label>
                                    <textarea name="atracciones" class="form-control" id="atracciones" placeholder="Atracciones destacadas" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="restricciones">Restricciones</label>
                                    <textarea name="restricciones" class="form-control" id="restricciones" placeholder="Restricciones del destino" rows="3"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-default">
                                    <div class="card-header">
                                        <h3 class="card-title">
                                            Seleccionar imagenes
                                        </h3>
                                    </div>
                                    <div class="card-body">
                                        <div id="actions" class="row">
                                            <div class="col-lg-6">
                                                <div class="btn-group w-100">
                                                    <span class="btn btn-success col fileinput-button">
                                                        <i class="fas fa-plus"></i>
                                                        <span>Add files</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 d-flex align-items-center">
                                                <div class="fileupload-process w-100">
                                                    <div id="total-progress" class="progress progress-striped active" role="progressbar" aria-valuemin="0"
                                                        aria-valuemax="100" aria-valuenow="0">
                                                        <div class="progress-bar progress-bar-success" style="width: 0%" data-dz-uploadprogress></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table table-striped files" id="previews">
                                            <div id="template" class="row mt-2">
                                                <div class="col-auto">
                                                    <span class="preview"><img src="data:," alt="" data-dz-thumbnail /></span>
                                                </div>
                                                <div class="col d-flex align-items-center">
                                                    <p class="mb-0">
                                                        <span class="lead" data-dz-name></span>
                                                        (<span data-dz-size></span>)
                                                    </p>
                                                    <strong class="error text-danger" data-dz-errormessage></strong>
                                                </div>
                                                <div class="col-4 d-flex align-items-center">
                                                    <div class="progress progress-striped active w-100" role="progressbar" aria-valuemin="0"
                                                        aria-valuemax="100" aria-valuenow="0">
                                                        <div class="progress-bar progress-bar-success" style="width: 0%" data-dz-uploadprogress></div>
                                                    </div>
                                                </div>
                                                <div class="col-auto d-flex align-items-center">
                                                    <div class="btn-group">
                                                        <button data-dz-remove class="btn btn-danger delete">
                                                            <i class="fas fa-trash"></i>
                                                            <span>Delete</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <p>Agrega imagenes llamativas...</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Registrar Destino</button>
            </div>
        </form>
    </div>
</div>
