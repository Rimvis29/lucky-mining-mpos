<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-info">
      <div class="panel-heading">
        <i class="fa fa-refresh fa-fw"></i> <span class="rounda2">Round Statistics</span>
      </div>
      <div class="panel-body no-padding">
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th colspan="2"><span class="rounda3">Block Statistics</span></th>
                <th colspan="2"><span class="rounda4">PPLNS Round Statistics</span> </th>
              </tr>
            </thead>
            <tbody>
              <tr class="odd">
                <td>ID</td>
                <td>{$BLOCKDETAILS.id|number_format:"0"|default:"0"}</td>
                <td><span class="rounda5">PPLNS Shares</span></td>
                <td>{$PPLNSSHARES|number_format:$GLOBAL.config.sharediffprecision|default:"0"}</td>
              </tr>
              <tr class="even">
                <td><span class="rounda6">Height</span></td>
	{if ! $GLOBAL.website.blockexplorer.disabled}
                <td><a href="{$GLOBAL.website.blockexplorer.url}{$BLOCKDETAILS.blockhash}" target="_new">{$BLOCKDETAILS.height|number_format:"0"|default:"0"}</a></td>
	{else}
                <td>{$BLOCKDETAILS.height|number_format:"0"|default:"0"}</td>
	{/if}
                <td><span class="rounda7">Estimated Shares</span></td>
                <td>{$BLOCKDETAILS.estshares|number_format:$GLOBAL.config.sharediffprecision|default:"0"}</td>
              </tr>
              <tr class="odd">
                <td><span class="rounda8">Amount</span></td>
                <td>{$BLOCKDETAILS.amount|default:"0"}</td>
                <td><span class="rounda9">Target Variance</span></td>
{assign var=percentage value=0}
{assign var=percentage1 value=0}
{assign var=percentage2 value=0}
                <td>{if $PPLNSSHARES > 0}{math assign="percentage" equation=(($BLOCKDETAILS.estshares / $PPLNSSHARES) * 100)}{/if}<font color="{if ($percentage >= 100)}green{else}red{/if}">{$percentage|number_format:"2"} %</font></td>
              </tr>
              <tr class="even">
                <td><span class="roundb1">Confirmations</span></td>
                <td>{if $BLOCKDETAILS.confirmations >= $GLOBAL.confirmations}
                  <font color="green"><span class="roundb2">Confirmed</span></font>
                  {else if $BLOCKDETAILS.confirmations == -1}
                   <font color="red"><span class="roundb3">Orphan</span></font>
                {else if $BLOCKDETAILS.confirmations == 0}0
                {else}{($GLOBAL.confirmations - $BLOCKDETAILS.confirmations)|default:"0"} left{/if}</td>
                <td><span class="roundb4">Block Average</span></td>
                <td>{$BLOCKAVERAGE|number_format:$GLOBAL.config.sharediffprecision|default:"0"}</td>
              </tr>
              <tr class="odd">
                <td><span class="roundb5">Difficulty</span></td>
                <td>{$BLOCKDETAILS.difficulty|default:"0"}</td>
                <td><span class="roundb6">Average Efficiency</span></td>
                <td>{if $BLOCKAVERAGE > 0 && $BLOCKDETAILS.estshares > 0}{math assign="percentage2" equation=(($BLOCKDETAILS.estshares / $BLOCKAVERAGE) * 100)}{/if}<font color="{if ($percentage2 >= 100)}green{else}red{/if}">{$percentage2|number_format:"2"} %</font></td>
              </tr>
              <tr class="even">
                <td><span class="roundb7">Time</span></td>
                <td>{$BLOCKDETAILS.time|default:"0"}</td>
                <td><span class="roundb8">Target Rounds</span></td>
                <td>{$BLOCKAVGCOUNT|number_format:"0"|default:"0"}</td>
              </tr>
              <tr class="odd">
                <td><span class="roundb9">Shares</span></td>
                <td>{$BLOCKDETAILS.shares|number_format:$GLOBAL.config.sharediffprecision|default:"0"}</td>
                <td><span class="roundc1">Seconds This Round</span></td>
                <td>{$BLOCKDETAILS.round_time|number_format:"0"|default:"0"}</td>
              </tr>
              <tr class="even">
                <td><span class="roundc2">Finder</span></td>
                <td>{$BLOCKDETAILS.finder|default:"unknown"}</td>
                <td><span class="roundc3">Round Variance</span></td>
                <td>{if $PPLNSSHARES > 0}{math assign="percentage1" equation=(($BLOCKDETAILS.shares / $PPLNSSHARES) * 100)}{/if}<font color="{if ($percentage1 >= 100)}green{else}red{/if}">{$percentage1|number_format:"2"} %</font></td>
              </tr>
            </tbody>
          </table>
            <table class="table borderless">
            <tr>
            <td>
              <ul class="pager">
                <li class="previous">
                  <a href="{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&height={$BLOCKDETAILS.height}&prev=1"> &larr; </a>
                </li>
              </ul>
            </td>
            <td>
              <ul class="pager">
                <form action="{$smarty.server.SCRIPT_NAME}" method="POST" id='search' role="form">
                  <input type="hidden" name="page" value="{$smarty.request.page|escape}">
                  <input type="hidden" name="action" value="{$smarty.request.action|escape}">
                  <div class="input-group input-group-sm">
                    <span class="input-group-addon"><span class="roundc4">Search Block Height</span></span>
                    <input type="text" class="form-control" name="search" value="{$smarty.request.height|default:"%"|escape}">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="submit" value="Search"><i class="fa fa-search"></i></button>
                    </span>
                  </div>
                </form>
              </ul>
            </td>
            <td>
              <ul class="pager">
                <li class="next">
                  <a href="{$smarty.server.SCRIPT_NAME}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&height={$BLOCKDETAILS.height}&next=1"> &rarr; </a>
                </li>
              </ul>
            </td>
            </tr>
            </table>

        </div>
      </div>
    </div>
  </div>
</div>
