Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9A4CCDC0
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172632; cv=fail; b=jxG6EheceAfKsi+FP7zu0kz09b5toqcJCPELPsgZpNiqPh5tq88u7zskJmrN5kyQhNmVxanAEwHBK63IMEsfdNDl26mrvmYrGwV7p0fPOwmMlVxF7I/2Y9hmqUFGsQ2jTxiig5BjwoiZ1YBraXKjB0nqlaLSa4+JY0WU2IjcuIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172632; c=relaxed/simple;
	bh=KpnU3U894QLNIBXygkIO0ahTXGx0Z3pw+JY4fOlaXes=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YWwcs9veRSNrDyG23AXrAfrmpDuFksOcB044nvF4qd98l+7bDNLkIyFYWKYCnAP2boYtWZ2RsRC6RpnY7JR8QuYCFi4ZMf+3JrBwXx+nlmYxYAl28VFAXhZmzz6BjShvQ6uD4q8V/b2HTgxRz9yHkmpYsVjjLq/pVb3//yBLzJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ELsIjeXm; arc=fail smtp.client-ip=52.101.193.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ELsIjeXm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Q9CezQVWoSu/98CVyh5+plX9wFgw0tEmpNApawTe064GvoqU4orBSFpml561n/wz3i5ynXHP6rUZiVwIqH+/HNdhJkdW9ID4qjnMQUO0pqyJ3Ck+mrUxm/6EoRarClduXUlcmvtU7gVRbv/BQ3GOCd4jG3Wb5koX3FLLoLDNJdd9Fwf2GZPZ9bvHXJsfQzTHn7s361ev/pkH5KQApaee3dsQs5I2wZW2W8lWAtGAWCUomtOoIapOtmmLcVGCVm6QjQw0oLsPGucbWe6NY1835jtjYq+/SSJtlsCbfHHPLIYRy055VzLUvu6Bg4di3I6VuOv+oWzIg9dJjJmtKOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZpnEAtJsxUXaa/Pr4caV5nUmhVN2JICc6XTZ2RLWgA=;
 b=prZMLwEl80TQ3sZWR18hDYrC7VVCkXV6SwBgyojZyojDHuHv1DoNtY2BsTarVp+mCRAPuy845QwT0Dk50f3zZbmdwXaT9qGVDCvWJr8F4GjqpOutSoke2PjAOM+lMlszHCa33xTkjjbgorbzZ/YshP5Yskf8MhdFsv4UOIketsTVKcHvR4nSQTSJDSssRSGhpWIhmce9QSkZ2+J9Ka4vnrvPxDcmWoCDYqYuORvMXnjKkqpe5LvQ2xYcm+Jdw8xV/4rx4ofhqdKeM645qmg/K/zcBqh/H/mHvnVmZ1M+jziYOSDSKTigtSpIocPU5BAixRTLhaYkxXzi55DrSPk2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZpnEAtJsxUXaa/Pr4caV5nUmhVN2JICc6XTZ2RLWgA=;
 b=ELsIjeXmKhCig4fB2eG+bp2eRnVFpySw77ICX16J8D/7vyolT1XW6iT4xbXXAvIoqYxbDLFZ794BeNvgT9wPcshqciuH3vrAMu6HIc+h1ngSv42gJWXnUmPlXyO77j9PybKN4n2dY9cc22I/Q+Hqmgsf2226Qt2bItxYLF/vvcSCTc+qP6K5/FA+fPjac181pVwTtADdY2lsWiss9r8vZEMd1XFYS1X9Z/cz2/rLyqn2RU/xkSfBVypN91kBnEdtxIA7AZa58efplcWah0eHA1B1f+wtHzuLqa3vVqoqevXIqVsVQC6n7RUi6HlLcHU3QQt7afj9yp+KC+crJ2MmuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:10:24 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:10:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 23:10:21 +0900
Message-Id: <DLMR8D3Q17YD.W0G16F19WB2L@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 33/33] gpu: nova-core: gsp: match a GMC response by
 flag, id and sequence
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-34-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-34-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: 02667142-743b-4872-60c2-08df197c6948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|10070799003|1800799024|376014|366016|10067099003|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yejOPuqdqDwXOqzsoAmTrG7JXmyhUFvzX8rYPqzrGD+rBsxyR9u6J4QnQ4jRqe0fOwgPeNOSyetYbzdTtHhJj7Pd0nIUSRftkqdbZ9we7DYAmXcELkzglg1KWAZuv+gNlHRZVVpF2xgQQ3/ktMGxxcz1mPN0Y7UzYqdubuzmqBnyJRaEXiZk5l5qu+ArkZ95ctRfzgp8ucVw5cIuZd9S4UO66KMQMrYMxg0VPuA030vD5sjHeyc3tR0p7dCT1VqFiTF6vYe/Nv+hLEsNvS1K5H5vnvleTr8+oGncTI0L7Vd/Wzf+y6QL+tGG6g+/oTDNAkYDpg0HQs2maRXJaAJmNOIdcYnETiEUU9AUjYMY/xoIwYbTXxiEsej4P3gbJQrROu5FbDTXXKCORTzWwc46SiP8KHewpv2b7CC3zBfmHQmZCfbtFYPRMA4n2JOUYkCHTGB2BsCENJLqZtd4mBvAI4JjAv0hFbsX5tNjV8fLZ3IscoD6IZB1PdT3C/uSsckJ9B+8YxMuePXAZoLkr9p5bwsquOVVRKYBqBpgc5UVWFWWVvIAjM19md1cI/Z+VvhV8Qo/kQK24AQNnsDbt4e3rr3hjn12+bOFQyzsO1pxaBi5w3xVuQun5mjYBJ4WILsBokyfYZg7mZ2ZLreMQ9VXZha73e/Z17gVvGe5C0LpDGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(10070799003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBpMjdkTFdaaGF3aGRpb1JERUJmWDNtTncvZk50VlNXa3o3M2ttbXg4dnpm?=
 =?utf-8?B?MlhBSzVUMGtGVnR6OXFJV2IxQmhRNXNMNVFrMHJva3A1VzhBeXNZaXhndm9S?=
 =?utf-8?B?THkwMWM2ZFl4S215ajJId0ZhSlcxOGNqMkRWRkF0VVFOWXJodnh0RFM0elFv?=
 =?utf-8?B?VG1iZnk4ZGdsSHNlM0VWTVN2U01HMkJuWHBSRitsMWVYRzVUUHptK241UlpQ?=
 =?utf-8?B?WitLbWZ5RWFxZ0F0cnl1cTF5Ym91L0tSZkEzREJaT0NoNytwQ25DQ3dlcDlQ?=
 =?utf-8?B?WjFFN1VlRFdoMjQ3ZGx2eWNtQ3o3dEhRU3BTZCtRWXY1eG1tWks4cTVkaVNL?=
 =?utf-8?B?R0RXN2NHaERxR0Z5dW9iM3FnRnB2LzllUS9RQzdSNVpCMWw3SUNWRVUxK1NM?=
 =?utf-8?B?SFhQNDh0anNyTnNGalpKWlpENWQ4ekU3bXE1VUx3QlFXMC9RbGNJckJhU0k3?=
 =?utf-8?B?WU04TzdjTFJCSXJiaTBSdDRYTzNMNjl1K0M2M3VVcGtaVTR1UkUxT2p5NFlv?=
 =?utf-8?B?b2Vsd2o2SEt6TGczZTlEcFFGRDdhUU00b1BFVlZVUjNiV0dtQkk3NmRnWlNm?=
 =?utf-8?B?Nk5UdkRUT0wxMUwzMFliSWt3TzNpdEprTERsOGFqVHpOOEVxNk4wcXlURGg4?=
 =?utf-8?B?ZEdyaElFOWptWDhMSHpnSE5iTkFlWkdCbHVLMmNxQ2ZPMlJwNW1RU29ZTFZ3?=
 =?utf-8?B?K3ZxRWQycUFLMGJJZWNmOTB4d0RyUHg2Y0lqSmNFNnY0OUhIQmhyWlc3UHFh?=
 =?utf-8?B?a2V5blZXcHpRYU5jNloxY1gyNTBNb01vNC92ZllLVEFHb0hCR0FaWUE5Tm9G?=
 =?utf-8?B?V29PUFl5Y1poSGdXdWdVdjRiQnc5akNIL2tDUm9sdktLSXdsa280N1IwS0kv?=
 =?utf-8?B?MTA3TkRaejd2eXF6SG55NmhQeTVVSjVBaDNKZ3IwRmtDSTRsS0JWR0hvZUtE?=
 =?utf-8?B?VktkREpDUG1EYnZIYWdTOFg1cjlmREVHVytVb3FUcGI3VXliUmRFQVVxS2t0?=
 =?utf-8?B?bEZjV1BiM2JEN1B0WG0zRDZ6aTJVKzRJRCtzS1lMdCt0c3JCYVNMUU9XQUNU?=
 =?utf-8?B?TUt1YjZ0SE1BVUpCQ1NYaEhWTVBxdmlLMCtieE1JWXdaRkZFS2laS3MySE5k?=
 =?utf-8?B?aUZBNTJGNzNDNFVoY3FvNUhSVFRsNU1LSFJLQTNBTzRDRE56VjVGWXluMUtI?=
 =?utf-8?B?b1Vmc2l6am1CR0JsSkRKcC9nWThjR2tERWRCRmppQmF4d0o2WHFIRlJLVTV5?=
 =?utf-8?B?QzZMaGMwa0dBT1cwalVTSEZkUjlNOXo2TVIrYjJNTUpNUHFsUzdGSWpJa1Nt?=
 =?utf-8?B?cGJKdVlWYlNSVEIxTzRGbzhNY2w0VnJub1c3NHRNU1c5ZEQ5SjBZL3FHb3Rs?=
 =?utf-8?B?OWMycnIweVdhYUFLdVdCY0tDd2JuQllFdDdVSDhIOHBwQnZBcEhYTUl0SmQ0?=
 =?utf-8?B?cU1zQ0VuTkZ3Unc0ZDlDQzdldzREYXdlVCtpcGU1WHR1WVJ2NWRWUnJlNG1I?=
 =?utf-8?B?SmpVcHlDNDJVTG9zYjN2YlRBQU9CYm43eVRyQkUyZzlock1vVXk4SlFLbU1W?=
 =?utf-8?B?M284ZGJxOVRNYy9KV1F6OUJFNFIzZDRyMVQrRlRoTTZObDRKOXNNQ0s3VXJ4?=
 =?utf-8?B?QUFDNkVmNW9hTkkyZ0hmS3A3U2F1aExjKzRCRDFzL280WExYdTZrTmM3ME5k?=
 =?utf-8?B?NGh5TFhyZ3c3Tm9JTmkvMTY3cWQwaWR5N1libDBpTVlEY2FNVjc2eW5SbFgx?=
 =?utf-8?B?Z09Bb0VheUxQeVM4MkdwN0UwQS9BdE9UYXI2ZGNYV3dOQ2RkZXBucC9wc2FE?=
 =?utf-8?B?dm5qbWk3cngzMGpsMkRXenNHUVdXc0NkdXdHV0lMZEpuRGtETXhjYmdZVXdM?=
 =?utf-8?B?Y20zdzdoMHJmUkVEelhmTER4eUxzUlMrNDMxa0YxM1RnV2lWckpmcWdydmdv?=
 =?utf-8?B?eHlVWGlVZnNmaU4vSGEzdTVvTmQwMG9OR0lQZTc3dnczeXF2dDhPU21jNnVK?=
 =?utf-8?B?Qm5mL2NOeFpkWFcwclh6MXpOd2J3bzNPTHh6cmRmYnR0QllaL1B2NFc5d25L?=
 =?utf-8?B?dERMUGd1VjZrQjlTL3BjSnZCTnFQcVpyNGFXb3VyalBiU1NXV3RTUnZOQlFD?=
 =?utf-8?B?RXE0NmxaRVNNeUptaXh6b2hpS09yR2w2R3BmWTNYcUFHK1hOaDBHZ0duTGRY?=
 =?utf-8?B?d2prd1ZyK2grQTc5T1FTSWQzZFZySHlWT1FWZFBJQWFGd0gwNlhYZmtIK3py?=
 =?utf-8?B?Qm9CQmUxVjB4WlBQOU5BTTE2L2JBbkM5cUxnS3dCKzVOc3lvWnB6eUxZR0pD?=
 =?utf-8?B?MWNaVUlUWnNHOXRYOFJOVDI1V2Q5RFB6LzNLTk1jdzFPN2pCRlZHQ0xmL2Vt?=
 =?utf-8?Q?Taf3pu3EQs/JkUodhILuNdl9KJMhScrDifNLgHlukluhW?=
X-MS-Exchange-AntiSpam-MessageData-1: ir1w7JrkNPOP3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02667142-743b-4872-60c2-08df197c6948
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:10:24.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UPkDLWpmRxb3/zu76P8zi4rspp+QNrmL4+0Wi0GC5uFMZGYM4lzU3+yom0+hsPXI4yR0ynuL8TeT1BJ8k2LLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628

On Fri Sep 18, 2026 at 10:07 AM JST, John Hubbard wrote:
<...>
>  // SAFETY: All fields are integer types with no uninitialized padding by=
tes.
> @@ -801,7 +817,7 @@ pub(crate) struct GspGmcMsgElement {
> =20
>  impl GspGmcMsgElement {
>      /// Creates the queue element header and the GMC API header of a req=
uest that carries
> -    /// `payload_size` bytes of payload.
> +    /// `payload_size` bytes of payload under the RPC sequence number `s=
equence`.
>      ///
>      /// `max_response_size` is the largest response that the sender acce=
pts, and zero for a request
>      /// that GSP-RM does not answer.
> @@ -811,7 +827,7 @@ impl GspGmcMsgElement {
>      /// - `EOVERFLOW` if a length does not fit its 32-bit field.
>      pub(crate) fn init(
>          command_id: u32,
> -        sequence: u64,
> +        sequence: u32,

Why are we changing the type of sequence here? `u64` is the correct type
as it's the one that is stored in the GMC header eventually.

This patch (and the previous one IIUC) repair defects introduced earlier
in the very same series. Let's please settle on the right shape from the
get-go.
