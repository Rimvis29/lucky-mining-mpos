  <div class="col-lg-6">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-user fa-fw"></i> <span class="bfinda6">Top 25 Blockfinder</span>
      </div>
      <div class="panel-body no-padding table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <th><span class="bfinda2">Rank</span></th>
              <th><span class="bfinda3">Worker</span></th>
              <th><span class="bfinda4">Blocks</span></th>
              <th><span class="bfinda5">Coins Generated</span></th>
            </tr>
          </thead>
          <tbody>
{assign var=rank value=1}
{section block $BLOCKSSOLVEDBYACCOUNT}
      <tr>
              <td>{$rank++}</td>
              <td>{if $BLOCKSSOLVEDBYACCOUNT[block].is_anonymous|default:"0" == 1 && $GLOBAL.userdata.is_admin|default:"0" == 0}anonymous{else}{$BLOCKSSOLVEDBYACCOUNT[block].finder|default:"unknown"|escape}{/if}</td>
              <td>{$BLOCKSSOLVEDBYACCOUNT[block].solvedblocks}</td>
              <td>{$BLOCKSSOLVEDBYACCOUNT[block].generatedcoins|number_format}</td>
            </tr>
{/section}
          </tbody>
        </table>
      </div>
    </div>
  </div>
