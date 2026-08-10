Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE9031355D
	for <nova-gpu@lists.linux.dev>; Mon, 10 Aug 2026 02:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786330688; cv=fail; b=V6WK4CXuX+lwFIlM7jnKjZIOpBvq6XhR2vSRtTTQbDmIcGQu3i7/IRjFH2eYo/pxZtIvZv/F0pppJ+yFIBdTig5FUGbmP5OQBwZrhZl+Wjpcw2lnPWTVxuiMA5B1t1LP4Oz4rFpBETjWRkLrsxp47IQdmzvO1rRJ3O8LzMf5K9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786330688; c=relaxed/simple;
	bh=oypv96epdNHqOd5w1PZz0v4Igve4zN0JSVjEH3irMyY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lmyA0D+rzYajBBQGIf60YLN9jR3bz0WgOOCiZBzQ39q7rqYMWsZwO0f64NTCl6GO3ufip80hCLT36KMXtz6GYqAaAWaCNvop09Bh9M3rJYybG9ncET/ttpUBNTeFdHqhxhtlPbeE4jT+lMSpzs5f/je108Nv2QhRn5J5OEAGwMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F4r/qPzd; arc=fail smtp.client-ip=52.101.56.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F4r/qPzd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I++OG9p74eNDMrPV2bos7VlLUwLRHxATT6ushXxpPP3saycB3A2r1aWGMfUC2YTk/tuakuZleums/F8L4dw3IUKbmQSnB9jk2bcfqyiKEpRSvdQEcCAqlfxiSLT7mgStRzhDHnH0emfrThBdhjNfz+FrQmdGO5tDTc/JmNupTWSuEAy4+eOo9wa7LdQQ4fLCG33LxdrlfeFrMGVD8v51dF1sog/WFL2WGWOfqwznadvhFuUTkRm/Opglm9gK0sfJoKB/nvW/vzx/J8OgYFB9RvHd3bCu78DPnC0KUA6mZVlHuRS/+n3agSsCOux/t/LdlAb/KDmbuG52+HfxZcsE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bxCodijmd8t5Hs8BLi/r71BuaYcV0o6lhbmwLfslx0=;
 b=ck99AzBw62lVuLRIeDfGzVpQpgkE1N7pITpSR7Cw2N1QtMwlwNHCtmf7EDc+8h2MSvhVg473/90ICpRr3kCYnyj8HieWNOt7JXxGbGAJWxO4q9vjNqC1HXu78gMssArvOalygO6FLZk84OyZjhGn5ozasJwjCiqMqpAtiVKz9OZ+DNiiisNDBnEYW4pVrmyft9dsK1MCvMKeL5/Mw6JCPYTsTLLzcPvmU4T84KV1O9ekK3BVsfXBsJLOnVNExDAFRC7L0WxUTummNfH17Xs520j8z6pV+jGgqDY5KkXQMrQK7Rqd0ho1YHPUkeI7/kZE2ve34RISYRjuCdnXfhYKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bxCodijmd8t5Hs8BLi/r71BuaYcV0o6lhbmwLfslx0=;
 b=F4r/qPzdqlegXlr26/1XLBHQ5HIu0GWcV9fdEfoX6PaqFv/t+/3caQlRF2FlLbt7hCXn0I76B8IFJm2aDhooXl6hptYt4YUkHA7Se0+1pjB5HU8nOpT3pzA7MFwHwXcVJfTbY7KpnNVrvtW13Ytq/Nwcvy4oF+dKbQ9qFxWm6qT1xWHrRYrwTkIqjV2B7x1AKrIHj/xbO1BcEU4p7ek14hXBK1zI9jd74P7I05BUHXcAvOl0xtLaUS+YmAo12yv+D1lf2OZPSOoUDmVOeJQrkc1fQGIcmkqxc3cK+UImwLgTSLFQXHum8q84yej+MId79Bw5kl/v6KvSJutKDModYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB8082.namprd12.prod.outlook.com (2603:10b6:8:e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 02:58:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 02:58:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 11:57:56 +0900
Message-Id: <DKKXDK0HOMA0.1L1HXEG9X4QZJ@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU is
 enabled
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260730181404.776028-1-zhiw@nvidia.com>
 <20260730181404.776028-2-zhiw@nvidia.com>
In-Reply-To: <20260730181404.776028-2-zhiw@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 00477113-5e9e-45a3-0567-08def68b301c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|23010399003|18002099003|22082099003|56012099006|10067099003|3023799007|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kK9xTUpvnTlHK1Kp5C6y9/SBFbF/uxi5+IQ27lmWIMIIji8FwpY0CD55ijiwXAB7cjfjvockrX+YAHXTFQUH08BA+54iVSrpWuENkB2CMJ7dN08m2dR7ttfUV3FD4JpNCofH/xeTFI3r3GjdIzO7ZRhl3Tj0D5kbq//FgaBbVm3A1Garh4PuufuRcWSnflqoLb6vMBtIXNw8n+TKkMJgmE+98ayp2AQudJVHhLjaj42Ap5v+NzdHGY45uwctbxSKcE6/yKjxY8f4GfQXhsKsZGNdqtz5ZL8gqY44PJiQ2OqL24vFgNSRcMjMZ3HfrcsuOlpo6LRrtxonsAnpLr8SHllhJV7QxCSzPs9E3JpnMGLsdbsX57pYQclY3J/ztnBmn4UD+jg3QqnDRmryjT/O0plGJlbobRlQDcxWO+pMKeP0wUxfl3eNwv/+r2T0Fk49qcw20ko2CT76v8iGd53odF6sayezUsoQiYezFLCvdnrCcWryorrdCHmVjg80T6a3KyRnTRKTCGbrcmXZthX9XcPR144afez2CqrUFHKyI23GMgn8eSgeGxLN58aCeVzP46wfsuQ9RiEgoHvzgYVRvl6iEbaduqjxL1LcTD6FseBJNHMcCdnm9jiWOZlPIuujYkj4ZiM5xqgpRlqBKdZBAZiV4PhijohFXnDYmnXHorU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003)(3023799007)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUs5OTVMMmQ4UGxiL25OaEkzLzF5Z0U1TlZXbnJiNXRoaHREc3lRT3ZaUWZ6?=
 =?utf-8?B?MklJNCsyMzViRTJKTDY1djIyeUFFV3ZVcFY3U3NObnFtandBNzNwWm43UDZW?=
 =?utf-8?B?SVNLeFlkYVpqRGNqS3dtVzg1akt1cG1hMGUxVWRSSzBtcHcyRHFJb1BGNk1y?=
 =?utf-8?B?Q3U5aHFNSi92MHdacVluSjg4blgyRUh3MGc0MjI2Kzhab3cwck1jMWhHNnVq?=
 =?utf-8?B?MHJSVzM4anhySzBWeUhhMUxNQTZnQjUveUdIWkpuMzAyMS9hemkxbndBS2hu?=
 =?utf-8?B?TVUvVXhVT292c1Jzem5PdmxzTzR3U3ArV0x3YllVQ0FQYmRJaVAvTXdFSVlH?=
 =?utf-8?B?RzVzRXpZclpiQ3JPMW92SEVlMGM5ZXJnK2hPY2doRmx5UUtPWDZEVEhKMW0y?=
 =?utf-8?B?eDVud2cydG1Ib2xTUnR1ckFWamxFSUFUZ242Zk9GWGkyR2ZXYll3aVRYNENz?=
 =?utf-8?B?dnNwa1FDZ1FFUXBzK2dEd1N1S0JhbmpRRVh5UHpDOTBxUGdkQWdtQkpZV3V3?=
 =?utf-8?B?RDhLUDJhT3BHbFBWTVp1Sm93cEtsK2txRG9OTFk4aXY0dnpsQTRZeUQ2Q0VE?=
 =?utf-8?B?SXZhUjdJUlYxWCtCNERNSk44Qk5aL3loWm1NV1BWZXA0aWJaYmlKVTN6OFdD?=
 =?utf-8?B?SDRnZHBmUUc0NjlnanVrdndEdE1aUllDUk5SUGhaY1dkK3FGdGdyRUxZcnNR?=
 =?utf-8?B?YTZwS3ZwK2o2bGVYWDhUY2I1OHFSSi9zM2t3QjFEM2RlY2czTDVUR2lsZXhE?=
 =?utf-8?B?eWs1VTZqLzhQanZmeE5OY1dwc1phMmRhMHMyN2FTUUFnOHQxcTkzQ0s5WVlD?=
 =?utf-8?B?QmZHanhaSkJENVBkOG1wRitEN2FPMEJ4cUlBU21XSUgraFRiZW9DSTF4S2FM?=
 =?utf-8?B?cEZabHlJTUtRMlo3bDNYWWR3MHNuMDNIMW9LV0JVUmRmTnFPbVJmbDdzRU1r?=
 =?utf-8?B?SlVxZ0IvcDA2d2NNL0xFc0luREpRdEFPd1dPM0E0aUNJVWVNaEw1TmdITnQ1?=
 =?utf-8?B?NTZ5aVIyRzlIQ3hlVFlpSmJkWmI4VFRDclZ2QVhnOUs5aC84ZFJYSXR6ZXBK?=
 =?utf-8?B?cys5c3FZaHpaWlUrSkZMUHVSdmZZd3RmcXY1U1plekRRUkxHZ1dYbTJGUHps?=
 =?utf-8?B?MjFrbHJsak9kTVZxL0RocU9rbDk5M2ZUZjkwUCtac216WnR6KzZwVktoaUp4?=
 =?utf-8?B?TFJPQ0w1L3VvcVNJUmYyREIwWVlQb0JIS0dMT3lCanJRUy9iUExCSFJEMkt1?=
 =?utf-8?B?QkFqclVIR2N1VnJVYnA5V3RaSmQxQWY3WS96SWI4dXFqWlZrS0hJNzV2UURD?=
 =?utf-8?B?N2FmeDd6bEpra0prcUFuOTFJL2pxeWpBckdqUlR0NXVGdXhoOVZta3NkWjEz?=
 =?utf-8?B?L1FhZVdEeHVwc0JTS1lpbmhySyt0TTFnVWpYd0xsRm9XYndsbnhRWHVtYWky?=
 =?utf-8?B?NWd1cTQ4b0FBZGg0MUZXZm9aa24rS3BLU2xFRHR3T0Yyc0tGZ2VoejI4dXFZ?=
 =?utf-8?B?RGh0bXVVWXcvSFdCQ2pwSHJuOHZXMEU0b1V1ZzFvc1prdldGTDNScGxvL1pX?=
 =?utf-8?B?eWhrc0JJeFlzaDNVMVJ6a1RYRzBFc0p6Z0JMdmhLSjNIQkJLcUgxUTNzSEtY?=
 =?utf-8?B?SzJ4UExVdHZkQktRMGpYWEtjdUhSNFcyR3hNL2lXRHVUR0RiS0VoQ1FlZDlw?=
 =?utf-8?B?ZWZHc0t4QzJpTGtPRlpDMHlycGpkUjFqMlppVkhHWDR3Y0U3NTBhbStIVkpX?=
 =?utf-8?B?aFRQR3BoWDhETlJHRWg4M1VkWXpQdVJUY0hPaDVjWWpOYVAzbFlHUmg2c1l0?=
 =?utf-8?B?WFJOdlRKOTE4d3h1RVEwYW5RZDNoWnk0R0diVFg0L2Y4ZWs4QWlvZEh6SmRW?=
 =?utf-8?B?V1d0OEZ1aUVTS0hNUlczYUJ2Y05YdXRUSjRYWVNrSmY5emt0b3A4Mk1ZSzBp?=
 =?utf-8?B?bkRzS3drZ3dsWFRwYkJWRENXR1pYVUNiVlNCSWV2bGtYVmdTeWhXQkJqQ2Qv?=
 =?utf-8?B?aWF4dDRaWWJEcktJNE5vekt5ajJHVWlabkRySjhyTWVuMTI1MDlKeXByb1V5?=
 =?utf-8?B?Ykt4SENTVzR4SHZ5bFVqbVp2VUlRdVRjd080U1h6WFZFTGgrdjRHRTk5V1VD?=
 =?utf-8?B?UXNYbFdCMSt2VEFVTjk0OG5RVC9DUGhhOTRvaTJ5SThxZytUNkE1Um9RMGE1?=
 =?utf-8?B?N24yTGQ2eEJncXRjbkdPZUdhTjM0QjRjOXRwd0h1S3JRYTFCNlVQcElMaUdV?=
 =?utf-8?B?dWkxUWsrTHZpdkhkMlBKQnlwWFEzbUZIZ0xaRDlPMVpOUDFzdHI1SWE2UkND?=
 =?utf-8?B?YjdFS1U3YllrK3A3WHdBK2IvYVU3cHYrdTRzd1h1T05ZdTVZUm52SEF0V09P?=
 =?utf-8?Q?QnzvRetS9w2A6IunuN8cHDwkKPFuQRbWG0sTv8HYwcVXf?=
X-MS-Exchange-AntiSpam-MessageData-1: qCV0vl3TUueaGg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00477113-5e9e-45a3-0567-08def68b301c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 02:58:00.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfLYcdYlzGJFpv65IIm5bjHEsyruatumbbblIOw+aIpfPB6F89u9oiT0mtePL2UFfOL9BaKYaFj0T58MzN1afA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8082

On Fri Jul 31, 2026 at 3:14 AM JST, Zhi Wang wrote:
> GSP firmware requires VF BAR layout information to correctly route
> interrupts and doorbell events to individual virtual functions.
> Without this data the firmware cannot set up per-VF event routing.
>
> When vGPU mode is enabled, read the VF topology from the typed PCI
> SR-IOV extended capability and populate the GSP_VF_INFO embedded in
> the GSP_SYSTEM_INFO command.
>
> Register GpuacctPerfmonUtilSamples in MsgFunction so the receive path
> recognizes vGPU perfmon sampling events from GSP-RM.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs        |  6 ++--
>  drivers/gpu/nova-core/gsp/commands.rs    | 15 ++++++++--
>  drivers/gpu/nova-core/gsp/fw.rs          |  4 +++
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 35 +++++++++++++++++++++++-
>  4 files changed, 54 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 727b8ae4bcb7..c086026dc2d8 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -86,8 +86,10 @@ pub(crate) fn boot(
> =20
>          dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active=
(),);
> =20
> -        self.cmdq
> -            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
, chipset))?;
> +        self.cmdq.send_command_no_wait(
> +            bar,
> +            commands::SetSystemInfo::new(pdev, chipset, ctx.vgpu.state()=
),
> +        )?;
>          self.cmdq
>              .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vg=
pu.state())?)?;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index ffc25fd8c47b..11d0c7ec371e 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -41,12 +41,21 @@
>  pub(crate) struct SetSystemInfo<'a> {
>      pdev: &'a pci::Device<device::Bound>,
>      chipset: Chipset,
> +    vgpu_state: VgpuState,
>  }
> =20
>  impl<'a> SetSystemInfo<'a> {
>      /// Creates a new `GspSetSystemInfo` command using the parameters of=
 `pdev`.
> -    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chi=
pset) -> Self {
> -        Self { pdev, chipset }
> +    pub(crate) fn new(
> +        pdev: &'a pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        vgpu_state: VgpuState,
> +    ) -> Self {
> +        Self {
> +            pdev,
> +            chipset,
> +            vgpu_state,
> +        }
>      }
>  }
> =20
> @@ -57,7 +66,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
>      type InitError =3D Error;
> =20
>      fn init(&self) -> impl Init<Self::Command, Self::InitError> {
> -        Self::Command::init(self.pdev, self.chipset)
> +        Self::Command::init(self.pdev, self.chipset, self.vgpu_state)
>      }
>  }
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 6e8e7d822ef1..6afe08abd868 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -254,6 +254,7 @@ pub(crate) enum MsgFunction {
>      GspLockdownNotice =3D bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTIC=
E,
>      GspPostNoCat =3D bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
>      GspRunCpuSequencer =3D bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUE=
NCER,
> +    GpuacctPerfmonUtilSamples =3D bindings::NV_VGPU_MSG_EVENT_GPUACCT_PE=
RFMON_UTIL_SAMPLES,
>      MmuFaultQueued =3D bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
>      OsErrorLog =3D bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
>      PostEvent =3D bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
> @@ -303,6 +304,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>              bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> {
>                  Ok(MsgFunction::GspRunCpuSequencer)
>              }
> +            bindings::NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES =3D=
> {
> +                Ok(MsgFunction::GpuacctPerfmonUtilSamples)
> +            }
>              bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED =3D> Ok(MsgFunc=
tion::MmuFaultQueued),
>              bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG =3D> Ok(MsgFunction=
::OsErrorLog),
>              bindings::NV_VGPU_MSG_EVENT_POST_EVENT =3D> Ok(MsgFunction::=
PostEvent),
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-=
core/gsp/fw/commands.rs
> index 6dc31d1bf5ae..edf21aa8c61b 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -16,11 +16,42 @@
>  use crate::{
>      gpu::Chipset,
>      gsp::GSP_PAGE_SIZE,
> -    num::IntoSafeCast, //
> +    num::IntoSafeCast,
> +    vgpu::VgpuState, //
>  };
> =20
>  use super::bindings;
> =20
> +/// Builds the VF topology passed to GSP-RM as part of the system inform=
ation.
> +fn build_vf_info(
> +    dev: &pci::Device<device::Bound>,
> +    vgpu_state: VgpuState,
> +) -> Result<bindings::GSP_VF_INFO> {
> +    let VgpuState::Enabled { total_vfs } =3D vgpu_state else {
> +        return Ok(Default::default());
> +    };
> +
> +    let sriov =3D dev
> +        .config_space_extended()?
> +        .find_ext_capability::<pci::ExtSriovRegs>()?;
> +
> +    let bar0 =3D sriov.read_vf_bar(0)?;
> +    let bar1 =3D sriov.read_vf_bar(bar0.next_index())?;
> +    let bar2 =3D sriov.read_vf_bar(bar1.next_index())?;

This basically confirms the discussion we had on the SR-IOV thread: the
iterator pattern is the correct one here.

The patch itself looks good, so I think we can merge it as soon as the
dependency is in and Danilo's feedback is addressed.
