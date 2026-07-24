Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590D13D503
	for <nova-gpu@lists.linux.dev>; Fri, 24 Jul 2026 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852386; cv=fail; b=rQ+QagQgE9FkH4KluhR0TgUrJYYqiPcPOjZ87dJGmyF0I4QHTb6n+jj3Wg+ttKPrQBYUAnKuR3hdmXXVjmd6oUKGzgcgQK/NbrBP56OmqdV4X2NuxAh0uU+9yjSMbvB5xgQKiI5aG2mj1AZ4KDT5F/Qi4fqwWPbCBfIVsVWlK9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852386; c=relaxed/simple;
	bh=J6Rt0BILbhjz3LBYmZLdRa1Yq0guJQUtaoL/0BWm/Rg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lqkvABkAzeOQHT0SmhhZeFxtFQ5Q3Q8H2mz5uQ1Y+mqwXXNEdPtO6mSR2URb2dwa8q7cBB99ve9VeEVFnG/f4FHQ2XpGwwVkpr5JfCza+JfzYFPA5fzm9LOttIkGw7l11P51nJS+13Fu9iLhC1mDVjy0o7yxvXopalZQUvI7Ys0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kS6uAw5d; arc=fail smtp.client-ip=40.93.198.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kS6uAw5d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPH6jyHOXmRYJZBsZ6zOP6JyID1oBpiXOvlDqrxBDK6vAAi8WGEYrLi5r41ZW49xh+nOoAt78Js4n75hZcIiAlCgs/AuHbhF07xtFm5+vIV8HMVRj9QToZerN8NK8JXJ/oX7+33gpu2nQYMXFr7Q2z1khjo5xIMZcWHT1t+cHyZKqFd6LOCF4qLB/bf+HJmm/lDCs3A1gviIrLmQbmSrz99P6VzP46IHwNjSNEpSh8IXZbbEcBgwCCyWnD2xYOmkkI7TsOCKTp/o3Omope/VTRu5PBJIgAZoOYDFR/cQHW0KVUS7b237Nkt2IRMqwCQiNd6KGyf7IqbflRfZqR4u5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6Rt0BILbhjz3LBYmZLdRa1Yq0guJQUtaoL/0BWm/Rg=;
 b=C+viEQybwQWPJmKsKskGQ2OKncCsXqPBZAQbB3cYui74pmMaBiQzSm8rjZe86I9GKZxJ8YyjssxgN+sUX9h7R1ZtsmEKBQL0+7sdEWx/XXu0MUfVUoXsTAix3J4Lws3U1qixqh+IUof/JwFGTKqs0QPavXI8F+dfuUd/RfOkx9PDduU452NGc7coSmfjxi/W9vZV5cBlS7TiAsjfUrrnl/OSKVOdHWB82b0A14XmFg4QgF2fcFdh6QB89jDUwK7R30DS4sYGeMzrcxkHFyguc8JWKtZJ0uuThRRuCdn487MjBveiRFApBMW5l9vSSpIxmMxIIljE2NoMxQkVYz9IPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6Rt0BILbhjz3LBYmZLdRa1Yq0guJQUtaoL/0BWm/Rg=;
 b=kS6uAw5dxX35+rJg9Hkq8eWZnOnFbVEmFvrlSebT4BFp4SOBz2sO1BM6DMmFTyC2BvuT0haQ8+W4xK0FqewEosfBbzFyI5bkMis8NHS1eomPR7febaHnAaK0VGgsKpUL61D2OPRJ4Osk9ScmqFeeegBJK/wjLKI4ARe2hklYCfXp8vdYMVM0TNdbmNENq/Zh9ixKuD80mXOzqCoEUziD5+6e21cNRSpVLi6bgWHlw21zxKxReimJ7XAdOBO6psvrw/1mIkA/vKJLJPHpTrJAzBxFWB5X5GEieUcRqnzPq5rvjs2JMUcfVhEqfM5VzEF7l3t9EMjtAcx0GScAPtH+ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 00:19:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 00:19:37 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 09:19:32 +0900
Message-Id: <DK6DD0F0DG8X.3DWBVKEXK49J1@nvidia.com>
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
Subject: Re: [PATCH v5 0/6] gpu: nova-core: boot GSP with vGPU enabled
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260722073913.1807677-1-zhiw@nvidia.com>
In-Reply-To: <20260722073913.1807677-1-zhiw@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:604:221::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: b123f5ca-578c-4bc7-9aa2-08dee9193f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10070799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0nUeuF49MkIWctXrYy/abuR5F6pVN/yZYdyhMzU36GYAOn41FpEBD+iYM3pleURM9nTP/S9qUeI8YJMnKigwP+181jzrZWP0OCcm9OtbR89rYjA1B+EHHk0su+8nNVTySdIQ3SFvnl6u5VyRGW36YOuX1OMj/x9g2Ow/1m+CDhbpl/9mbGA4OI6IMqqdZ2gfmVPbEBw7CqEKn6g18JYmT9Lb2e+HqPnm2xeaydvP7xXLYpM2UE+mxxoCMyHpEA29i3SlQ1p+gHlDTGmn2nF+QWbW4MtMg/kBasPDa2MqjVlZBO/753EUT2nC4KS3XmwrecHWmdQ4MSnveW1ATF9N+z3SPA0uv336Px0iXqEilIzuczzJweS0ZfRPv8cLENSBExayl4A7Za0krzUGxhy/LDTpkuSsW46CVK8vMMugndJ5REeAMo1aUvWXaW8fbWaKXT8P73nhe4BDAUwBiWV2iNheZeYf1IjwtyN8IlwaCzpgl5r+tr6va1a4dAzgsz7ltcrTVRU005f6c8nM7HoIiAbtu0j/Ed5OPoALAvPw1XdnfZni0WP4qxX1r49CPmqHF4zw/hfoyMymw2eIn4nyDraMUPLX/EEo1pwzCaBn5U9y4ib6J0TXFPN5GkIHvlbYgpDD+Q/hqUzekrnOkjOgknZK/8an1TBLAEpD15L+VvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10070799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUlGbDliRDNjTzRyQ0FGVWdGWnllMFViakgwU2RZR2JQY3hXeWIwZDEvUTZM?=
 =?utf-8?B?R2pMZVBINlBibXNiTWVzVnN2SWpHcjdibVVGK0ZmdEJZREpsemRzWVF6SjFx?=
 =?utf-8?B?d015YVJtcnNvZEwyRGNSS1ZZTHZ1VmNuSVd2ZnplVVpsckdSZFJqTG1sNllt?=
 =?utf-8?B?dE1LaXNOUGlXWnpjMDB6T09tTmE5TnhTTjROWTVWS2ZrdGZENThVYjRzeUdq?=
 =?utf-8?B?V25Xa0FPRTF6ZzNOYjk5RVhucm5GQzhvR2dKK0xHVTlKcE95SWk4ZWhmSi9y?=
 =?utf-8?B?MDRYekJDekxxMEl5VWVVS1VzRjAySXpJY1FCZlNOMUxuaTgvREk5dkw3azky?=
 =?utf-8?B?OW55MzlzR29RNndJS3hOUm1DUzR1UlVsbldtWUc5cWl5dHdRSnY5Z3V4NGZi?=
 =?utf-8?B?NWg4cllHMFZEcHlTT2tyY3BXTnlxaS9lbWV5Nk1Zb21RYmxwc1JubEdDaWlH?=
 =?utf-8?B?eVF3NXo3b0h1cERsZjArRWtiWDlEUG1jaXFDeE40MC9RbGJzV3VzKzhhdjBk?=
 =?utf-8?B?N0xkZkY0eUtPejBoOWpieGMvT2h3bGxXUldFZXFkNjdGT1dJajJBd1gycUVq?=
 =?utf-8?B?eUVOcWhwNy9xVnNCWTJxTkVWTE1LWHdBcXdkN1RuQnp3Z0dlR1FTOHlmZEJU?=
 =?utf-8?B?TVl6WUJwQS9ZYmdkN0RWQkREOGFEa3hKV2c1eXVvZitUeStFR1FSRS9MK1I1?=
 =?utf-8?B?Nk9hVUY3NlpvcGY4bXRTUDh4VmJZMGRIdVFDWXVpL2tjdnlSNldmV0wvVm4x?=
 =?utf-8?B?SEVYNmE4V0wrVjNqOGxxWkxWaE1SWDZGQjRSM2R5VndnTm9RdW9PMzZoQ0hn?=
 =?utf-8?B?WWtueHI2eDZGVDJHbTR2MHoySTYxby9HTThlV25ucnlUS0VjTzhoQ0pEOHdw?=
 =?utf-8?B?b1VVMEhIVjV4ODBvVkJ3SGdyT0N6MmtlOHI4aWZaZjYxUEZrTkRyOUltTWdi?=
 =?utf-8?B?ZlpSeUlOWXdhRThoU0ZOUXB5enNQcUY5VFlYRGs1eEI0QXY3cDA3R1JiYWlP?=
 =?utf-8?B?NUtPRjZlTmlnemczYkxja2lOa2QveVhONG1ncmVBV1ZSR1VGaFNPRlRqYS9h?=
 =?utf-8?B?c3VGTzlaWmR1N3htK0tDOVlHNnljWlBiSk1kSHFtMk50b3RzU2pIM1RCeHc1?=
 =?utf-8?B?YkluZC9KVEhJSVBQRmVlMFBUdFp5MDMyVW5XSzNhbVYzaksyMDh4TnZRMUdo?=
 =?utf-8?B?R2ZtV2s3NkdvaFN5cTJGbWc1R0tySjgxNThUSUNzaEZzZGlqeFpkVGJpbHhu?=
 =?utf-8?B?MmxGVTluZzJYUmJ4eFFNbk1VNkw0ZWtGdmlaZVVUU1Nma1VLMmlYak5xOGlR?=
 =?utf-8?B?TTNYNjFNN0NTd2lZSDNrOURFbUxIZ1RsUWo4RTRoZFZLRTV6QlhBOTNmMjBH?=
 =?utf-8?B?c3I3WEFDM1A0TWs2MTgvTVV1S2xVQkZpcE4vdHBQbTVmQnFpRGcxNnorY0lN?=
 =?utf-8?B?THZzUEZicER6OE5yZDlEMTJVcW5IeHFnNTVBS2c4WkRWdVJCenFCaUlTeDYy?=
 =?utf-8?B?U3FKYTR2ajYyTGg5VFlZQWwwK2xDY3BjV25QcTQzQm5FSk5LK0JOM1FGUEFE?=
 =?utf-8?B?bjU2M0FBNm9FUW1FRzBOdWxwcVlBVEhDc1BVaktsaXE2c3N4ZFNnQzRKVXg1?=
 =?utf-8?B?TGZyWERTMlRrNHhqbGdHSitjM3o3VTJFTHJmSkw1MURUV1ErYWJJZlZnV21a?=
 =?utf-8?B?SkMyT0RtZVR3NkxBLzF3TUZ4N0VOZHZHT3NWSWh3UHVUT005bmh1bzArNDQw?=
 =?utf-8?B?MUF5TlBseEVVeVN3UlNxVXFYeURZaUcwN0d4ZTVsSEJkbzFnc2diNTJaa25Y?=
 =?utf-8?B?UEE2UzlueEh3Vk1pVjlJaDVUYWthbWhjbWtBRjE1SVQzVFpDVXBaMHl0Umda?=
 =?utf-8?B?akNlbXlhTUJzUVF0NzZuMjd4Uy9zVjVLL25KNitNbFhlc2lBU1hFWVMvdVQ3?=
 =?utf-8?B?MXhETW5HNjBENXExcDBGUkxhbUtnRWx2NkoxZzYwVi9TdFh4aE1UZDlPbEcx?=
 =?utf-8?B?M0FwOURzUjM5d2VUVWdEd3hUZDRBbklNbjg5SDQrU1dsaDRaY1pUc3BESW9t?=
 =?utf-8?B?VFByZDZGMmxoODVSV2lXM2dOb3A0RXZ6QllwWGIvc0lXMDQ4Q3ZIVWtBbjRH?=
 =?utf-8?B?YzFJb1FTY3dJeXIyR2toV1JvK1U5QUE3RVBVTU1FbGhEaGtZSzNycnZha09C?=
 =?utf-8?B?YkpRVXEyQ0FieFBybDhvQVIrZHFoN3N5WlYyOE5aVzJOQzJ1N3FLWUJTNkll?=
 =?utf-8?B?K3ZSM1luL2JZWXhwZUZBWG9MRWRpNEFrWHZJVDl4dmRDc2liQTdYcy9ucng4?=
 =?utf-8?B?d1hJaXJPMkxXeDlqQnVOUjJ2Y002KzlRV3hGVWNybUFGVzROOWYvalhmdm0z?=
 =?utf-8?Q?yF4RQxz+xTK+52xIY/oDnUNoimEoAPALIVlLR647y57MV?=
X-MS-Exchange-AntiSpam-MessageData-1: iQ2gzUKJSa4qpQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b123f5ca-578c-4bc7-9aa2-08dee9193f07
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 00:19:37.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQE1wjCjYhwHoKUS8rs01KBAbzMSrIjqurVOLdx+on041KyYmlexFPXDW70P9OB5Is/+Dw+C7OyTcZwYhOyuWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722

On Wed Jul 22, 2026 at 4:39 PM JST, Zhi Wang wrote:
> Booting GSP with vGPU enabled is part of the first milestone (M1)
> together with the Rust fwctl abstraction [1] and the nova-core fwctl
> driver [2] for upstream vGPU support. It allows us to validate the basic
> GSP boot flow with vGPU enabled and upload vGPU types even before the
> remaining nova-core dependencies are ready. The nova-vGPU WIP patches
> for all milestones can be found at [3].
>
> This version is based on the latest drm-rust-next, which now includes
> Alexandre's v6 GSP boot process consolidation series [4].

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
