Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AF393DC1
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384337; cv=fail; b=UB1Fr6W4pqtL1vylJIjWi7g6iokp4w9wvp1JVKuXuKUnXq7Kvs8RdRQ1/C+JFGexdepyFJ9C0QQq7foH54p5UdAaZJ3Bxfz8NpVlLgOGjg1E7VDXwi1zXiqjr/QhUEhZnqoxso/nuFsBD1KyPdiLjPHqtg7aCS0en4mI2wVTeTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384337; c=relaxed/simple;
	bh=5PdJ4nfHZcQk8APsE3FcXd2s3lGMnUE23QgXN+1lhq4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Y34loyaQ9ltAzv37U4gvVixAVEJWlvQhGYXFs7FExvnYYcJueyOn5UYxV/teAL/Beia9v12HJgSPxrZYtPJWdhj2sol+2hi5G1DN16YxpeD6jgSzZPlmfaTayQKNk+z7oDCZtANul4OVQMCqQFsKqrAAekssyNY1Yc9EVv43YO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PQMQQzLW; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PQMQQzLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzy4DE3E/TORM1q/dFG8fMfahgBzOwefXiIkKrvTqGj5czud5vDTFFKMneSnv60skI14XFbBwjeRlVTtV2BcdCp7okQyOyHyNVbX5h3T7+1yoOwj4onjmoeI6TTKiiGSV+cJjCn6GSPCWnYN5S1mVZoc5gtQVu4wh5lEATwbQTeLl8eSOTK7a9qP2xKaWxo/oSg07BM2fRRZHTaJGT7nbPjCcleOP8BmAwUwQ/s666U6taTjxXe+/kXPoy4iXgPCHf/5lndQpOpQd69UPDNdziqtDk69iq/GFFhY4LaFo5CkBcPoMPymBHGl/6N/9EyAkUWDeP3U6G7wEwV8X29yng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PdJ4nfHZcQk8APsE3FcXd2s3lGMnUE23QgXN+1lhq4=;
 b=UZOqYWQ4p4HYJJkUT8tl7zUb/GG8jDklD/Qy2ttDsnhn4HnS5iBbD2ARAi2kuRctKNWY1l77M5/KsGBDang4LQWr/ymZ5Nh5faq5OmhwL2aBpknC52ZWFNnn1xKX6rE+ddyDRd/mB40zPZrZ4lkMD/P/6SF+cWqJ33rdUrwhERsr0T4n5nZXcUWVZJO+Y8lK2Kc48ecQrFx3paT8aJZB2MKwToT3jqtjEPwk+cfefnlZMyAXxH0cHMUy74gkTOjRuQs2cwSeer/IuR3c8ockCHQVzQ8sR8pIYth38ai7lNXtysPQt2+D5ZAGRHX9wDFYgTvpamN2tx+agG4VjsmaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PdJ4nfHZcQk8APsE3FcXd2s3lGMnUE23QgXN+1lhq4=;
 b=PQMQQzLWeXkBtWaaeS+XJcCsoIlW/5NXw0Aok3zIN+k5XEbikX+ZYmgZNMVCCDXSA9bsUR9ny/BAuFR4IvrfnoiFciynkV5Obz42TAe+aOp0sKzRtLsfqdmA9MzZ/cwJdzbdznXtJpapqPzBr8fRcQ4zwu621MtSMr5COCmsYCO+3nMcnsPyEf26yFKEeZSuIDK9O35QImBQu8vgfEQ4q1Q0bDVz++eKWqt+ZVXN8TyrDYnO19yeDHJOWIXEZHlpdV48ae1Xz7JRkcV6fnOLk8L7iu6On6ili8ARnFoCboswrtgaKJ40pikbb1gIwMQC/ALLjNpUz8ukyzQpGztKUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY5PR12MB6105.namprd12.prod.outlook.com (2603:10b6:930:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 07:12:12 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 07:12:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 16:12:08 +0900
Message-Id: <DIYDKL3XRQK3.37X8K75SZ0DKE@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 06/22] gpu: nova-core: Blackwell: use correct sysmem
 flush registers
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-7-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-7-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY5PR12MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c4e422-a022-410d-dd6e-08dec076444c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|11063799006|4143699003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q0jfhoc7yyJXCyzyclxuaALbY3UMnrsfqPxyNfTfA7vBsOwwF5KC7oDpgr2+XsgxqDmzC8q9hL5DdpERe9E5O8CW35puDnAjjg6f1qIO84q94Kqqbc2OZgj7WHGKVwa873eHeb6eWRBOz+DIMNwNNLDX/eTvw0uylwYgEQlgb8sExVoqBjf2/aAP+qDjnFYt8bgYEc61LLSt/tWyUYu/UX2PLbRPZUtg/cR8AUkSTRQc3NeCS7em5O7X+05k/lx3yvwV111x95xJi41jN5bLYfZ/jut5R8GPzoZnjqVvAjH1CXUOKN4m/yw61B6jDQMDwWHFkZaV1+bqcEJv946Wma5Ksb5Fc9jDrXcORWBNHhTzkpb6FmSMGvAopulgA2/HJLMGVLjH3f03qBkjoluXJzN3sEHbp3g32KcFLr35J0mshVTVfVphjMU1pHGAlDjJtvc4ijNw3noVYGnzziBZCuRDmwUkkItQjfmekVBXw3UxjQ8IGGJIURa+iqQnlXo4PPyNklKLngL0M3NOQtvIi+2BDHjar258RosYjRCV8wTOAUSv0kQcjvAWR3avARPXexVrWwmnglPmYhfpMFWrZhY5HXEdvGbds88+TqqsHARVY6m7yJ1eNv9sHvcBwi148jg3TPEnP0PumjOvYBPQ3fxhGI0t2CRuOGFR19Ii1e2A9mMIi7ULv1/MXn6B2sWy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHpQQjRLL05kYVFuSHhaQ0ZQN2hPSTdTc2RxS3Q0VHFlSjBVYmVqbFp3Y3Zl?=
 =?utf-8?B?L2N0RldsMkFUeWdxaW42WWc3anM1TTladGgxZFcwSWdrWCtXc05jS1puckxU?=
 =?utf-8?B?dlgrVjBoejhhOEs0TlhtQklucmZFMFd3ek8zaFF4ZmMrbzgxSXQzNXI3T2Zj?=
 =?utf-8?B?UHV1Rnl4cnJvMjZqK21qMlhKTm5lRVVzR21Mc0lsMTdweUdQQXB1SERGM3I5?=
 =?utf-8?B?T1BuYXNlV0trbVcxRXdLemFGYWprbFhFdSs0SklUcG1pWTJBck5hWnVBaEVT?=
 =?utf-8?B?eThsK3QxdjZMd3ZLTVV4YkE3U2t3K3lrbytqUHJIc3B3NjZxcEsrcmMxby9B?=
 =?utf-8?B?KzN2Vzc5MUtCRUVlbmZaU2p1dU50eXZpTHZFNHVVaTh0WElmTk1waysyR01q?=
 =?utf-8?B?eDh5MFNlVHVQYWlmSXFGT1ExQXZxUForZ200VHI5MnQwTlRldmlINzc0RE1m?=
 =?utf-8?B?L3JFRUpmdFUyczA5U3E5MytHQXg2VlhkSWJkVy96aDNCRHdqNFQ5YlFwNDE1?=
 =?utf-8?B?d3hOM0doYkdPQkxVY2lwRW1kZ0E4SHBicjgxeVBCV256WkN3N2pzckdLRFhr?=
 =?utf-8?B?bUtzV2FSOWNscEJhMyt4YWhaRG5rTFo3WERCTmFmbkM2a2M3ZGxQcHhFV2I5?=
 =?utf-8?B?bzRnSTNicWd2WStzWk5iSDcweU5rdkVVVkY1ZWozdmV2bHBiUXE4ZjR5RGNm?=
 =?utf-8?B?ekx5QXNhaDVzN2VtSzIrRjNYeWxwZXRBRmg2ZFZTNHo3ODN4U3dxc1hUYlhS?=
 =?utf-8?B?R1dsNi9xQzlXSFRBYThMVUp6QjVHbS9xMldWZUZEdTdlb2h2OTdXZ01ZM0JB?=
 =?utf-8?B?K2pmd1pYZ09QNGNZRHVaRklBaEFtWDJoRkNJaTBpbG13Nzg0QUJYcmJQNWdC?=
 =?utf-8?B?RkJ3UklUUEszQWhReFlwTkt4Qllmd3dhM1B3dmZzSURiejM4MlEzbjJieWkw?=
 =?utf-8?B?a2hVRzl5Tk5HaHlwK0cweFE0eGh0TTJYQ3lZL2NMbDVJOGY2RGx5OUlvZWc0?=
 =?utf-8?B?Y3Y0blNvUWg2a0QrNktCanMvcWhpb2NuSjk5Y3JIaVVreXdER3k1QlZKMitQ?=
 =?utf-8?B?NG5kak1XaUxZYlBvT3hxM01qRTF3VzMxRkxSNld1RXZXSFI1b3RaU0R4TkdQ?=
 =?utf-8?B?TVJtRTBTVm9QcG40QW4rdThGd3NJcFd1U2RabnBFTTV3clhHY1pPTkYzUXVk?=
 =?utf-8?B?TmNTZC9rOGpqcy80MlFNbzhtUGZhMFR1dHl2VXFqdkJHS3JTVHhpR3R1QVox?=
 =?utf-8?B?SG1rTXZLQ1ZlM05URnJTL3R1WnZ0MGdSbHp4SDBQZC9zMSt4eDBEeHQyZklW?=
 =?utf-8?B?SEFubE9DRWdiYklnbXJRWEZJK0xkRnFza0RIZWVCdkYyWW16d0t4QkNuajdm?=
 =?utf-8?B?aE56K1RRbDJmWWtpQXp0dDE4cWZZQzd5VFJjL1p3MFN2L2M5QTg5MjdnVThW?=
 =?utf-8?B?NVdLa3gvaFF1NGFUTjh0STQ3RXd6QmlHdm1sbGlDSnFXS1RxK3lyOE1RMmlL?=
 =?utf-8?B?cWk1L2Y4YkdIYkxiaG9FSkh0YU5FbGpFWWozcmErMjd5Ukwxd2dSdXlsaFpL?=
 =?utf-8?B?Y01PcDJiVGIwUXQ1NDVrMFlrRHloN0VmVWkxTTVWWU5uRzVhYUc1bVNGZFJ4?=
 =?utf-8?B?WE44VnBPSGxSMEhMY3BPMEczZ0FUUTFjR1UrckFMN3ZjNU9uMkFnaUlBYXB6?=
 =?utf-8?B?MkJJNXVwWGM4V0ZKRVBXWk5kVEdsK08rNGZFZklvOVQwbkczVjFXQzFiTkxm?=
 =?utf-8?B?ZUhFWUxrRHBFbHdjTk1zRytSQkwwYUZTdlA5NWw2dlJJemwxSFR0VStSdDR6?=
 =?utf-8?B?eEJ5TmQ1RnpqcjhQVUZOUUo5Sjg5V2l5KzlDYjNWd2dJaHNqRHdSeHVpWTU1?=
 =?utf-8?B?TlZjSU9LeldYVUlTVk9tY01jZGZOTlR4c1dXZGdXZzZzZEFpMEROd09oK3Ju?=
 =?utf-8?B?WW16NGpHTklLZG5CZGFxWXBYVzFzb3BuME9VRGVIV3Z1c3pQTTM3dDl1alpM?=
 =?utf-8?B?OGpDcnAwbnRtelRjbkhqYmZqTU50TlJoRkRJa3hwcjdUSlU2OGRkbHRHL3ZQ?=
 =?utf-8?B?RlRmZHZoRUFId0ZPeEtjWkhHd2RCc0VMR1QrWGtKR0luM0JlODFVUzk4S0pz?=
 =?utf-8?B?RHRNTXhCc1ZLVjNHNmthUk1Cd09mQmNLbzd4a0lDdmE1Njdjd2x4Uk9QMEww?=
 =?utf-8?B?bys1S2FxSWZBMi9pczVuNVJMSndGWVM4RzNYcC8rVHZ6b0NIb1Z6bDRGNG8w?=
 =?utf-8?B?Y213ZGNCUzRSU2x6VzZDSWNzNjZZblFveUZjQ2RmdWxQN1dRSUpxcC9UcEtz?=
 =?utf-8?B?YVBWd0NWMXkwOHJldm1aRFF6a2lidCs0d2IvL1NaaUdXSU9rRnJ3eVZqOWJ4?=
 =?utf-8?Q?PLmTgk3y0JZSDdZa14orkUuFUbiypt50EyvzHvgJd9y53?=
X-MS-Exchange-AntiSpam-MessageData-1: ElPwUeJDPcW6BA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c4e422-a022-410d-dd6e-08dec076444c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:12:11.9283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmIdebZfBbYw3icc6dt75VVbzVY1LZEnCUVhpDLTKQgBlEk3GPLBO9KvU8ioxuPdb/uWyuYtuesMjYckOkiDuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6105

On Tue Jun 2, 2026 at 12:20 PM JST, John Hubbard wrote:
> Blackwell GPUs moved the sysmem flush page registers away from the
> Ampere/Ada location. GB10x routes the flush through a pair of HSHUB0
> register sets (primary and egress) that must both be programmed to
> the same address. GB20x routes it through FBHUB0.
>
> Define these registers relative to their HSHUB0 and FBHUB0 bases, as
> Open RM does, and implement the flush paths in the GB10x and GB20x
> framebuffer HALs.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

This patch looks correct so:

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

But it only updates the sysmem flush stuff for Blackwell. It looks like
Hopper also uses different registers, so I think we should update it
too (separate patch seems ok to me).
