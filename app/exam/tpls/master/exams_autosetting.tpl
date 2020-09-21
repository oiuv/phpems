                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                                <th>知识点</th>
                                <th>总数</th>
                                <th>简单</th>
                                <th>中等</th>
                                <th>复杂</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$rs,r,rid}
                            <tr>
                                <td>{x2;v:r['knows']}</td>
                                <td>{x2;v:r['number']}</td>
                                <td>{x2;if:v:r['easy']}{x2;v:r['easy']}{x2;else}不限{x2;endif}</td>
                                <td>{x2;if:v:r['mid']}{x2;v:r['mid']}{x2;else}不限{x2;endif}</td>
                                <td>{x2;if:v:r['hard']}{x2;v:r['hard']}{x2;else}不限{x2;endif}</td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
