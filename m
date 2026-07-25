Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B742A82
	for <nova-gpu@lists.linux.dev>; Sat, 25 Jul 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784986051; cv=fail; b=WDRLxjA+os1Z6I+htLwKKPAjPAXbSlk5E8VvnJpetV4sxAkqtJxz4NMllcKyBICuGzEn0uQb1Fmmjwc+RajHTsmvuKgiip8bAu8+cApYLF534pITlCLmOCqEoUJBHgJpYlcwoD/iUnV1X9+comL+RexvqCJJvoGO7TrMUa34KAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784986051; c=relaxed/simple;
	bh=NuIQyYbKlhTseO71Pi+IgCgnKdN+DTMJH8jSQhcvjPg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=QYzEQM+ScpT0DsHR7kINN25XWwrk/Z3h+lveyQy2R5G1DMb19RgPr2mwZzGWU5Ow1h4FZqSSFVy8Di1oabCsh2jobqthVP1FN+QL2Ry3SyYc1MFXxc/vzaJPagHs8eg7Ex74GAM0TeW1/ED+X0wRURALsct6B+IX9eXw5Mwvr3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zg4GSphw; arc=fail smtp.client-ip=52.101.53.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zg4GSphw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ+XCRI882nk4/OS6eHYD140xWikqrFASWR6fRsJFLNG9X5Eq+VmYlSfiw/w/L89iQoYgsgXeRUqy0AYWt1omrhKPuR9tBPmiIxVh4S4tz5pFbw1hyhsgMA6KZN/sXa28BecsNPuHZbPaj6l5LPVeMYxMEyci5l7D4cJRqSrEzWe93C73nL0f+VeFDKWe45NSJQNgNnsDm4ptEu9oABo595xO+DWqrZbMXDO2kiR5DUVlmO0gaQNrC+yf2PJ+u7WoBB2yRzrCpLW4FNRsapROo8s8EWTqb7LYW9CqP0cvoXGBetJcTs8AMfYru1qm5M76bkMso/UK89XhZyEwrxpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBBxtriRY1RfWGfksnoQwkdhpz6xeeRagBnGg5fXOpY=;
 b=Yg/DmWtOLly1BU7qD9o2cgF3ENRhIKU+Fdo+7iksv2+3S0PSWWRowaJU+3uykOWNzJ459L0jSs7QYMXP89ynlKJOFcmCUCX+cPNHeYkAG61REF8pwSOaAShxYuWfNYRIZ+j2M1Aisuk3VqW5GPnPDS30IbTT+G65v1k/El6id7P9KbFfO4eaOG2v1m4g48PaYbnXta+2nXnLH/cfJChtJfh34Gonox1jmyCnVvHGaA4lhguBLBXu+zUGYu5P62kLKX4mYi6HLbtW8Djoe1KUZywfoxbcnrB0hS014wKhSJ+Q9T2TqwV3GROK3pey1NsE1Oa2GABAC9n4xRuUqX1T4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBBxtriRY1RfWGfksnoQwkdhpz6xeeRagBnGg5fXOpY=;
 b=Zg4GSphwrJk2dhbAsYdZDqVz2Jijf3fBSF6VH1fA5qEYj6iW95S7A0vw6p+hqlJZlkFj1djYG/Nl5ao4en+8xg6A4u6vVVizvh+jDErj4de85YmolJ5jsCn0SqqNBIwL7v0Xa3F4cCy3WuP1aLH39fyj06mhSN5s0Fz5gISdn1MFgTLd6vtvx4oLjCWqqaPnhy6GTKxFUOXmNdQsKhDvF9s8OWhz0v0jb3hf1e2dPmh33rQUT1HnaFezBWdemnTfZs0A/2MNlfWoW5ZEk0vv8amq35zIOQOa2bfo73qWXGsisW6SVQ4idevVqSl17Bi2HKz0PSH+peRNwdmm2ZzeEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 13:27:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 13:27:23 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 22:27:19 +0900
Message-Id: <DK7OQQAYBCQV.3PKBRU8CYCUNG@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Antonin Malzieu Ridolfi via B4 Relay"
 <devnull+dev.nanonej.com@kernel.org>
Cc: <dev@nanonej.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH 2/3] gpu: nova-core: Move PFB registers definitions
Content-Transfer-Encoding: quoted-printable
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
 <20260721-nova-core-regs-split-v1-2-384fa2a42244@nanonej.com>
In-Reply-To: <20260721-nova-core-regs-split-v1-2-384fa2a42244@nanonej.com>
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0ca805-d2e1-409f-5fb2-08deea507635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B2pr1KT9k2CF79k5kqq5eLjhxAjpzSk0lLO2A0wdZ2eH1EBIJppaGACBayE201ar5CcF8i2w1ROlmrV89uC+Ea4/ccKnuJSd1Irdo5YmI23tiPOqjNjin+463KVdfRH66H4iuIBYPPXd4QRrMqws+lc2FxAZNbf81058GKnkhfD+Nab5Y2nJDtUlyQh2TTu9uyV+XK/P27SZsqVkHFBI3kIlYxH4h2D8D9T3ZCuJwRnLU/8318OM1+WLqmSi3cJ9/F5JuZ34eq+T8XMyp6gNuZ6XtXvcge7lxRn9bGKFMDbm4oH3D6FWXJLoptl/P65c90H3XmQMqrEyfEsnroqnQD2xKqI7hhNWBBSfszlOMz8CYibWRhXFLcO/cE4LrEJfGZ+lR9zJAHDube1MnYPRgu43U0xnTyYXHB7IIHoOEjijK4T8cXgYY51zxbTY9jM9WaIMuzUjP4lCflsAOP+AcIm+0JIJJwxOWUPfbodAUQNq9hGYfELI2uGwhgSauB428NYYOXxSdneQpGSgFPfpN39uH7AGNAzhfz0x0SzrqJMsb/lMFN6RVR8216Gdv+JY+tI1m5EcUmfSqzTd7zWKbn19ZEey/wxqcfI41otlY0/3Sw74kvT20yVmgijAFemNG0GN2G2GEGQveBzonqUOivjBfgMlZRM8FXlqkTqnx0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2JhLzg2MkRLTjB5cmVpVndxS3J5eTBpd2J0WDM2YThqdUFuMDE5UldLRWM3?=
 =?utf-8?B?Qmt3MGpsNVlSaVZhTklNYWhtbUFvSS9qMU9pb2pHTFFtZldiaDh3VTJKUEVK?=
 =?utf-8?B?ZnczUXhMQnpvdDlXT3Bmd1RXVEVuSk5hQ1NGUEcrcFZWUy96U3ZWRW5jQ0Y0?=
 =?utf-8?B?NFNDOVhwckdGQS9UYVlsc2RRMDZwREw3MkxoQnZTTHdJOTZ2ODlNUjRvTUhI?=
 =?utf-8?B?Zk8zVFJibUFEOG1IS3RaY05wTWJZMElXZHNMcXVsbGg5VVF1VEM3dkdJZlE2?=
 =?utf-8?B?TlBYZ2tqQmFYa1A5Mll3b2N4UmFpdEx6dzNyVHF1OG5VUW5uUHdzUHdqUE9h?=
 =?utf-8?B?ZXQyUmdCMWh5VlVUd1Z5STR5bm9jN1JhQjEyN3RyZVpzaUNMRjZjUjdTV2NF?=
 =?utf-8?B?OTYwQmpDRFhnQlpEdTRCSW1KdlpLR2h5SUlmVyswWEVFZk14TW9NYU9BTDlu?=
 =?utf-8?B?Y1IzeWxoak15MzN5cTgza0ZpeC8zSE1uTDdQUmZyYlY5NHJTM3RmUm9jU280?=
 =?utf-8?B?c0dpUW1YcjdzaGN3YlpDUkFiQlp6anJpMGNOTjI5c0dLdFh6VEFXdExrYXB2?=
 =?utf-8?B?V25PUXZxUnpkbjJlSUNSMFBrWHVxTzRKQ0RTUzJHYTE0MDZtYlU5bGU0MGh2?=
 =?utf-8?B?dWpOREdERjFQb2ZLZ0d4RHkrcXZXWWVON2llUGdyZmtvK1VaRDY3blB4Ukhj?=
 =?utf-8?B?cGlXb0ExNGtKUFFoZzZPNXllU0txWFJFTU12cWdCZjBXSmw3dzl5L3J5SXF0?=
 =?utf-8?B?ZUFFV2FEMlpRS0w1K0FMcEd2V1Z0WFZpU3ZqMU92RjN3T01oaE40STlNa2FP?=
 =?utf-8?B?bVM2Wm4ycE5EdkZqb2ZBZ3hTVTY2bmdqaWdXaEgrcnI4NDZFenI2dEtHWXlx?=
 =?utf-8?B?SnQyNkhhakl3QnhiVG43b1dMWUJmM3R1eU1pSUwrL05oUk5POXlIdExGK2ly?=
 =?utf-8?B?U2RXdUJibXZ1a2NCZEtaL3lnUml4UWZzdnZXRHB4SzB2aU1VMFFzVHRPY1c2?=
 =?utf-8?B?MFloOENjYndEdTRUZlFSaUI3RTJiak41OWN0cXpXNnJwaFgzT1pVNUxIQ09x?=
 =?utf-8?B?VU05S01TMkx5VHFoQlBNNWZCVTFrcnk5eGJxTnNHK2xNbUludmNWNkhrOTVL?=
 =?utf-8?B?UW1VeFJXd3pWUDVEWE1BVEhXeVhVUXZRNGxUZndqNGVXUStjYlpDVWdPZzR2?=
 =?utf-8?B?RWptckFBd253c2dhN0R2TDcvWmZFMUZ1RDF1ODJCazlmNjdSSENtR1R2ZW9C?=
 =?utf-8?B?RnpMKzN3dkdPeWJlU3Zab0hZYm8vVWVPNlp0ZFMvTmFZdUs3ZVBPWmI2RnBl?=
 =?utf-8?B?d2gvWEhOK3FsT3FOSHNJOXlOREtoTGs0eFFxL25qNFJNZUcycEp6OTd1eFp1?=
 =?utf-8?B?UmwxbFo0TEs0NUloOWVxOGF5TDJ2blAxVWZsTE0wbDA4N2RNSUJQVTc3RTJ0?=
 =?utf-8?B?bzFaU1AvOTZvd3hvQTJpTUZaWnI0SVEyTS91SGhYb0YvbG1zbmJxY09vSGh4?=
 =?utf-8?B?VktIcTVBaENzVENRK1c3Qi9BMlpVSXVWQ29ueWhnTVlJSlNnc2o1Znk1eDJG?=
 =?utf-8?B?ZjVkaDlHY3ZNVE1ESWZZT2diT213RmIzdGh3WDBFalFXTnFpVDVFS24wdCtX?=
 =?utf-8?B?ZnEvdXdlQkJrZjhRT1hMb0RhRU8raFFmRnVuajdWRjVkR1l6OGNsQzRLcm83?=
 =?utf-8?B?aHJLTFVHUHl5SklMOUR3SXlNUW5UMVNTUWcrdzBCcTZTS25aTjN2RENlOWZj?=
 =?utf-8?B?M25BbUlxOVJrMVorTGsvc29uTzZ6YjZ1TFB5QVg1K2pyUGM1dENkSjlCNEI4?=
 =?utf-8?B?cG9QNjJXa05pWm9GMmNucU9ta1k0bXVLRmZpTFRlNGtCTFVWV0h4NGtQRVB1?=
 =?utf-8?B?M3lXdjEwR0Z2ZllRbU13UkxLc1EwZ2ZMR2h5eFdNNEtBdWZIbVpyT1p1Zlpu?=
 =?utf-8?B?a1BMbEN3cFZOOVZ0RnJ0QlJ0d2MyWmFXcUlLZnZ5QlM3MHhQQjkwOFUxcEJL?=
 =?utf-8?B?d05PaVF6K2p2L0t1SzRlUjZwejAwcGFuRFNqNjE3K3VtcVBUZi9xaWNKcHZk?=
 =?utf-8?B?ekVWRlRhMkJUNmtHRzNoRm93eFZwZzRXUllzMW5tcU1GdUpzR3hDVEtlcFhK?=
 =?utf-8?B?dWwyais4UUkzZzdLY0tublVmNSt1TVRzQ2hhajhXQmZ4a01QWEhSOXRUYjhM?=
 =?utf-8?B?UFpDRHJLWWFRam9Bc2dJR0tiaDVzZHJtczBSYnlCbFdVczRhb0VwM21zVU9a?=
 =?utf-8?B?YlZOT0E3azV3WFhPd0J1S3VsNm5FNzVjLzFHSm1FQ3l0UVVKMTZOZXY5c01C?=
 =?utf-8?B?ajFYbmxCeUQ4RWNPajRCUHp4emZaN3pZQTVma2N2TVVJVWdUdUIyZmpsZnh6?=
 =?utf-8?Q?zwFGCtkRjBtBavdoVo+sUPhY9zAZrThra0Ts71YbP8IvC?=
X-MS-Exchange-AntiSpam-MessageData-1: GPG1KvFTEye3qQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0ca805-d2e1-409f-5fb2-08deea507635
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 13:27:23.6635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0t3ZsyN/tsGkOJgQCUYk6xeEdIPB8lAzCpNj0qNCQAevGnkGfKsFF6miR9wqZqeSvbHf98R9ndBd55YO6d4mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

On Wed Jul 22, 2026 at 12:41 AM JST, Antonin Malzieu Ridolfi via B4 Relay w=
rote:
> From: Antonin Malzieu Ridolfi <dev@nanonej.com>
>

Every patch needs a commit message, even if short.

(also please check whether the issue raised by Sashiko [1] has merit)

[1] https://sashiko.dev/#/patchset/20260721-nova-core-regs-split-v1-0-384fa=
2a42244@nanonej.com?part=3D2

One more comment inline, but this is pretty much what I had in mind; so
looking pretty good imho!

> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
> ---
>  drivers/gpu/nova-core/fb.rs           |   4 +-
>  drivers/gpu/nova-core/fb/hal/ga100.rs |   8 ++-
>  drivers/gpu/nova-core/fb/hal/gb100.rs |   6 +-
>  drivers/gpu/nova-core/fb/hal/gb202.rs |   6 +-
>  drivers/gpu/nova-core/fb/hal/gh100.rs |   6 +-
>  drivers/gpu/nova-core/fb/hal/tu102.rs |   8 ++-
>  drivers/gpu/nova-core/fb/regs.rs      | 132 ++++++++++++++++++++++++++++=
+++++-
>  drivers/gpu/nova-core/regs.rs         | 127 ----------------------------=
----
>  8 files changed, 155 insertions(+), 142 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 864a34ca20b8..59e715b73479 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -275,8 +275,8 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gs=
p_fw: &GspFirmware) -> Resu
>  /// Returns `None` if the WPR2 region is not set.
>  pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
>      let (wpr2_lo, wpr2_hi) =3D (
> -        bar.read(crate::regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO),
> -        bar.read(crate::regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI),
> +        bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO),
> +        bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI),
>      );
> =20
>      if !wpr2_hi.is_wpr2_set() {
> diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga100.rs
> index 3cc1caf361c7..d13c9a826eef 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
> @@ -9,8 +9,10 @@
> =20
>  use crate::{
>      driver::Bar0,
> -    fb::hal::FbHal,
> -    regs, //
> +    fb::{
> +        hal::FbHal,
> +        regs, //
> +    },
>  };
> =20
>  use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
> @@ -41,7 +43,7 @@ pub(super) fn write_sysmem_flush_page_ga100(bar: Bar0<'=
_>, addr: u64) {
>  }
> =20
>  pub(super) fn display_enabled_ga100(bar: Bar0<'_>) -> bool {
> -    !bar.read(regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY)
> +    !bar.read(crate::regs::ga100::NV_FUSE_STATUS_OPT_DISPLAY)
>          .display_disabled()
>  }
> =20
> diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb100.rs
> index 6e0eba101ca1..ec55ec3fc7e1 100644
> --- a/drivers/gpu/nova-core/fb/hal/gb100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
> @@ -22,9 +22,11 @@
> =20
>  use crate::{
>      driver::Bar0,
> -    fb::hal::FbHal,
> +    fb::{
> +        hal::FbHal,
> +        regs, //
> +    },
>      num::usize_into_u32,
> -    regs, //
>  };
> =20
>  struct Gb100;
> diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb202.rs
> index b78e0970f66d..69ba35d2ea08 100644
> --- a/drivers/gpu/nova-core/fb/hal/gb202.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
> @@ -12,8 +12,10 @@
> =20
>  use crate::{
>      driver::Bar0,
> -    fb::hal::FbHal,
> -    regs, //
> +    fb::{
> +        hal::FbHal,
> +        regs, //
> +    },
>  };
> =20
>  struct Gb202;
> diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gh100.rs
> index d39fe99537ed..2867ae058d0a 100644
> --- a/drivers/gpu/nova-core/fb/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
> @@ -10,8 +10,10 @@
> =20
>  use crate::{
>      driver::Bar0,
> -    fb::hal::FbHal,
> -    regs, //
> +    fb::{
> +        hal::FbHal,
> +        regs, //
> +    },
>  };
> =20
>  struct Gh100;
> diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-cor=
e/fb/hal/tu102.rs
> index f629e8e9d5d5..2ef04ccb550c 100644
> --- a/drivers/gpu/nova-core/fb/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
> @@ -9,8 +9,10 @@
> =20
>  use crate::{
>      driver::Bar0,
> -    fb::hal::FbHal,
> -    regs, //
> +    fb::{
> +        hal::FbHal, //
> +        regs,

nit: `//` not on last line.
