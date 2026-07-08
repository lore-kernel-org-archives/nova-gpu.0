Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B92379C2A
	for <nova-gpu@lists.linux.dev>; Wed,  8 Jul 2026 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517857; cv=fail; b=sPoXshjTieuqOWYa/kBDn0Hqq3XayyzUQfSLMyaWIQ8y+C6T8bmgRt452XnlcUVBb6sUWhNgztTb7qe0eZB6EMEbxHyhI0DNsPOeJAOeC3Dv1C6oEMyxN12ZEssF3vYKerxgtZPak1jSK5Smsy2POSWPSsX/DPtD6gYzYba0obI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517857; c=relaxed/simple;
	bh=tkk9UovnslacBasgC4NSHasUgv6ks5tTdY3pP0hsNdg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iHaOHfl0ujAtWDZkE3/4CaiHnrl6QIzN9UNToaw2acVJ39erYpnhOws7sHoJMBmBxNAGnNaU/RaxLBOWu8pA63wTXuDK4hQN49m4mLyFoNKgHN1sOopx1kTLiy2tLdB9nTz6KoPmzqhZe91e57Xs9cdlSZGttLQF/PC67sPdeqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nYCEFcsv; arc=fail smtp.client-ip=40.93.195.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nYCEFcsv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwSl1uSQM73mwLk2HQMktuNTaOVAnZ8BIBdHJb6oYVH//MBYm7lPj0PY1bSP13mMlGSP7U7Yob/iyaN4/w5A4iuE1+q9CX0ZvhEPOkf40PQE495y36w+2r9Fo54wp47COO/WwCJXNte/k6VmnTx9ImI6Carld2hzxn15ytUdUx2Zeav+LTMoYggk6/3BdM4aqQjzjSAapKHNLT7fkX9KCD9GC0fG9AZLDmxikrxpzu/SwKUdRMXlUEfC5AAUMKSoz+y7JS9hRMDfMfcGJRnKnP4TNZNchhi1TsFrzbVb/WTA5T7isecrqkex4E37YhsAF7/CrYpt5Z9B9c3Q8UfMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KfSdBoC0uKH2UdGRqG6Iac/WdKsL0N2ei+hKstvcYY=;
 b=n6edBr7cY0inKZFx7VPYcPBvSHv1+ZEdQ/RpwRS1oR6UBons64vTvG+GIaXaCyxegVKGfndGWBBW+VhW4SMEDGriCxGKYRV15sCiFYl5NW0uRi8W8WKhfuv57fK/ZoA9SKzebxFIVzpcB4Gc4pvigJPEvyG7eyCTR5ffHc3Dq3YZ9xH8nS5wKqgx/CCAQvLpC9On8asEvFgsKspamamiosq4CwlsVG85pMbl3iVT6awbTdPER4ko/a7nSXr1dSSUl9nAD4kYcjRfM9HQsJcqeve9GZVQzyWe2gyW4IovJnAhLscUyzZweEk4nF2lVXCrErhTrPn/kavRpDdaB7AnkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KfSdBoC0uKH2UdGRqG6Iac/WdKsL0N2ei+hKstvcYY=;
 b=nYCEFcsvapbfnp6wtPMug/Taxr0iGXm1xsbRuPIbz67FXzIxlmsaOSHP6X3uoPlzilnIsIsQNlL+AIsQO5ObR92ujf8O1A7MG6nRcTn68OZG/v1tS8WsQNMRsRAH79Hn89KcTmEdd0mBMhXwO03mU+0Pt1+lyJsu5D0DIOCbDjBw5oMxI1CSohvCJ3Lfo7xD9xFMZzVQZ6UfOpWSDxNA11snQBUCEeXns94VdObmvkrPF9I023pa3KWFcT4yvQinby9BYskamZNzKV1urKh9DOSiPEymy/S8M/CCQwZ9yLN66dHdKrg/HDJxhpta++Ry88qVfNMEbEW5aaG1eu/XwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9011.namprd12.prod.outlook.com (2603:10b6:208:488::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 13:37:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 13:37:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:37:29 +0900
Message-Id: <DJT8B95Q1S2H.1LYZ0L0D07XOI@nvidia.com>
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
Subject: Re: [PATCH v3 6/8] gpu: nova-core: build SetRegistry entries
 dynamically
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260701062622.3499033-1-zhiw@nvidia.com>
 <20260701062622.3499033-7-zhiw@nvidia.com>
In-Reply-To: <20260701062622.3499033-7-zhiw@nvidia.com>
X-ClientProxiedBy: TY6P301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc18a9f-2235-45a0-414b-08dedcf61063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|23010399003|376014|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZoGPI+Xy8n3i0nA2InR/cnAyc2zMjWnwi4IDJeDGNl8h0f2cKX4o92bjULUnXXebI28uOmRE+dO0PxbagRduFwPBfT12MSUEYQrd7mset1izsbI+ZDikhWkD7WQVFCkzfFpu/I6qMj/8Lj+pSSngwCmJfYx/r3OCwSggaCVNlNF0KcIhACUEsIIFSyl2mOt9IQyXqvReKtzVC6TORBnBlASQ+Nks2mOtCfmThvBxCXu0mSaNze4LX8xSu1NbOFMRV0Mfad3nEYpTkqjYXf6yvXMMourfcYhL0vFnaCPQN/ymK/hfWVAYeTMwwEQUfi0CA65y8gKZbn1mIX9oNXm3n4XM4zxLgCJPe4MzpDS73gIZTUiOicmhXjuRhLVolv8mAefNbZtmbZZBLGCkO/mPe1Uup+rzzK7XBlfchYHDUHNCXxN4lLIeVwCLyqT5e7Gt1eqqi9/X9jLq/vKpac1I7EWYCr+VD3KY1ooN3eMAAOKMV/VSI9I3cY49O3TvHnMERwiTX9FIilnnR4GuLzaA+oiZarSPy7/ZV0qaBfbl98d6gEvd3kxkSeM+ZhjTNI77Zfh1H7QS2+yEG8yDGeIRHJZd34JsphLbIX1SSe9BolGIyVUNLYlVv+iv7UML3q3BB8zHgQ3RXEEcktkJuB0ixXU61qgiNkVQu/stzCqADaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(23010399003)(376014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS90aElBa1ZSZFFJQlN3ZGx5QXJucytBNDRmUTdzUTJ0YjdwUGZsRmxDWnc1?=
 =?utf-8?B?TElhSmhpRzJBaUl2MEZITmZvc3E3VzB5NFNkRWVPVkMyM3pCRnBkcXpXaVNz?=
 =?utf-8?B?S1Nvcm9BSTlPMTVPQ2ZGQ1BsdXhHYWZ1OE9QV21Qc2wvUG5TcnpjWDlSTytX?=
 =?utf-8?B?czN5NTcvWEJoeFQrcXdPbTdGd1hoa3U1dTVKeXd6ZmJONkdlaU4zUHZVbnBL?=
 =?utf-8?B?MHRhY1ptN0xYN21PTmdpSllXei9ON2MrYXF5YVFOZmM0VWNoM2xVQ3BmMVFt?=
 =?utf-8?B?UHBmUXgySXA0NzQzRmtZSTh0YlZhK05GVjBlYzlRWWlxZ2NibC9temZjM0ln?=
 =?utf-8?B?R0RDNVZpeFA0M3lKRTZsSVUzZ0c1YVFVblEvZndJQkZrZTRFYnEwaHJEano0?=
 =?utf-8?B?QVN1SEkxc09vWWtTOUtMR1AzNFJtdWtKUk0ybE1xZnVQQ3A5MHhGTjdHTE9l?=
 =?utf-8?B?ZGRwcVRnWER4Q2lRRlVsSndJQk5teFdnREx2L3ViYzkyMWZ0VCt1YUF3Vnpx?=
 =?utf-8?B?YVVyTHBXVnNmaUpxWG1ScUlnK0JIalpocDhVQVljWUNoZThGMm1YenAvSXZx?=
 =?utf-8?B?YWVyTElTa2tKRlZoN21vTDNicEVDaXN3OHJyZ0w5QjR0SFNsaFR2blFscTZP?=
 =?utf-8?B?K3h3bHV5TTBMY2EvMGsyZG9rQTVXb0ZmbUtXZWtFUVRjVjRyRlVobW1Ma2gx?=
 =?utf-8?B?akltRmNWTFdGaGlSWmZsYm9LT0FGZXdWRDJnaFdzeTZkakRHdVJuS0ZQQTBx?=
 =?utf-8?B?TlBQWWZWcXkvWWFXbEV2YXJYOU1RSXZXbzFreCtDV1kxOTMwS2dyY1dRQVdE?=
 =?utf-8?B?RDA0RHlnRkExUU9FTXpadEt6WTJCVm43TWZjMUFwclhMcHdyWFRkeHczZEtk?=
 =?utf-8?B?aWZrUEdYRWRJbmZjbndLbVV3b0tFL0M3eDlNamVZS1F2MDB5ZGw0dlQvSHg1?=
 =?utf-8?B?aHMxZ0hFeWFvWVV5VjFZSFQxNXY1Nk9GY25DbUFlUkVtbE14WkVmeGVaTXg3?=
 =?utf-8?B?WGFoci9rMEU3TDVHRVFyeXd1aDIrRWNhZVVaWnRxVW8wV1NIUDhsczhsRWx2?=
 =?utf-8?B?WVNrMDdNSDZjUEk0dy9xN2ZxV2M2WllVSi9PNll1YmZDVEVkWkJBbis3QWMr?=
 =?utf-8?B?WjZPWjBNT3U5TmhibWgxWUVpdzl5WmhPRHc2eXk1NVdITmowU3o3VDhxMWx5?=
 =?utf-8?B?czl1cWpnMFBGemNuSmdpUWNIbmNKMEtZeHZrVm1Vb1IwaXkxMTJVYTZMMkVQ?=
 =?utf-8?B?QmpMSVIrSlJ5VlE1bTN2T2ZZZmJ4a1U3SWxXRmo3cTIwd0RWS251ajU5UEx5?=
 =?utf-8?B?MkJmRTZySGNzMkJRL2Q3MnMyRnViL0UzSlMyUytJeXhMZDU5VFZkUnhCdVRz?=
 =?utf-8?B?YlREWWJqMmxFVmxxbmtXRmgwN1pVajk3WmJVbzBoZitYdGN1aGdaOWxub1Ja?=
 =?utf-8?B?RUlyckh3S2Y0N1plb3FYRmFDS1NpOEhKQThmZzhxMmFVUTlXcEpPUGltQjJY?=
 =?utf-8?B?SWowdzRQclFxMldOV0N1TlV6Mmg1cWFZMmRMM2FjSGRlNzdGMXVYVlI0TExR?=
 =?utf-8?B?MG9mWm9uUW85SWtTRHd1RUlNZzlSZlF6NU4raW00RmxhWGRlenVQTFYrZXdD?=
 =?utf-8?B?SmZacU5FZmJtUGxTVU1MTmJFS2tlMlVFcTAzWFhJRm80dVJBNEZyUDdJT3pz?=
 =?utf-8?B?SGlzcnlwb2RISlJHMHIyQ3ZETjJ2K0kvU3U4NDlES2g1bGVyWDVjRXI0RlVO?=
 =?utf-8?B?bXM4T3NKMWc1dnl6RytXeGdxb2JoWFZ6YTk0WitPZEdLU3cwMmNQYm96Rmg1?=
 =?utf-8?B?SXJ6enRjLzNlMGVoaVRpWk8vWU1Hc1pUa0N6ejZ6VVBzc2ovRno3YnI3SzNF?=
 =?utf-8?B?OXJXNnF3dENNNnFUcHZJWUt1M1dGM3B1NVdGMVBKV2ZNdVhpMkUzbWhZN01O?=
 =?utf-8?B?dmpyR0hKN2NqMk8yQkh5WjgyckVPRlYrd3U5UStxT3JOaW51Yi9DbHhiTDEz?=
 =?utf-8?B?RzhzOWMwaG84cHgrMHZFNHgrWkUrNGRyTFI1SkIwcjVUczBTb0VSNFZRKzd6?=
 =?utf-8?B?OU1WNTF5Z0FIU2o4UytPcFRVc2RUR1JlaGJHUWZIV2xGUnJqWjBwUGJnWmxn?=
 =?utf-8?B?S1llRmd6ODZtcnBmNjhBeTUwWkhYeTk3SFNHajRCTDJvT09ybjhtZUZkc3cw?=
 =?utf-8?B?Wm5nUXRIVldtU1orTDBvTXlLRStyeTJzY1RDVW80VmE3cHVEMzd1UXg1RXRm?=
 =?utf-8?B?RlNsVFlGMzhpbGlYWDBibHJueHFvL3VNL1pvTTEzaHQrc1lCZmF2V3A4TnZo?=
 =?utf-8?B?WkFGaktwdzRrRTlrSFBsTVlrTHFQdG0yZEtFY2xLbjAzZjlCallrSm9sckFF?=
 =?utf-8?Q?Qdd6g2MlPNLaaJxR9wJ32KIruZ4qEHRwLb+JtAN9XtcuR?=
X-MS-Exchange-AntiSpam-MessageData-1: eyjxZOl/hZSVRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc18a9f-2235-45a0-414b-08dedcf61063
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:37:33.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXXjq2EPJlqr4LMHif7EHtssTaxlLyzsPq6A4wb1SlYntb1/dAWFjBiEGtd/ppO6t4XJxFipDnUM9aML3R5xJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9011

On Wed Jul 1, 2026 at 3:26 PM JST, Zhi Wang wrote:
> The GSP SetRegistry command currently stores its registry entries in a
> fixed-size array. That makes every additional runtime-dependent registry
> object require reshaping the command data structure at the same time as t=
he
> feature that needs the new entry.
>
> Keep the existing registry contents unchanged, but store them in a KVec s=
o
> SetRegistry can be constructed dynamically. The constructor now returns a
> Result to propagate allocation failures while the command payload layout =
is
> still computed from the final entry list.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Pushed to drm-rust-next, thanks! With one minor change documented below.

> ---
>  drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
>  drivers/gpu/nova-core/gsp/commands.rs | 74 ++++++++++++++++-----------
>  2 files changed, 44 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 5abab54639a4..139cedacffd2 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -102,7 +102,7 @@ pub(crate) fn boot(
>          self.cmdq
>              .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev=
, chipset))?;
>          self.cmdq
> -            .send_command_no_wait(bar, commands::SetRegistry::new())?;
> +            .send_command_no_wait(bar, commands::SetRegistry::new()?)?;
> =20
>          hal.post_boot(&self, ctx, &gsp_fw)?;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 86a3747cd31c..dfb9f04e284d 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -67,37 +67,46 @@ struct RegistryEntry {
> =20
>  /// The `SetRegistry` command.
>  pub(crate) struct SetRegistry {
> -    entries: [RegistryEntry; Self::NUM_ENTRIES],
> +    entries: KVec<RegistryEntry>,
>  }
> =20
>  impl SetRegistry {
>      // For now we hard-code the registry entries. Future work will allow=
 others to
>      // be added as module parameters.

That comment is now orphan, so I removed it.
