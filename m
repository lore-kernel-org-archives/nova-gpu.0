Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013024.outbound.protection.outlook.com [40.107.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090EC3B6363
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484681; cv=fail; b=bccvTk5EZg/0K1qW+dZn7/zLOIrNTQZWIiukbj8S+vXjgiJv2eFlGXjgcKqQ3GvVLcVnZ5wC9KtNSaW6pHGZyiaoPuNkNREnoKufpxZlYe1YPULzAHrBHde9F0cs5oDPMf5DGU9K/WL3Nekj5UbiUy1FSwkmkevVPYW/vBwOxjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484681; c=relaxed/simple;
	bh=vCTzeVCueVQat3aXTSDH32b5RAKTyERMUIq7yLsEIGA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=gBz+vCMJrD8bO0p4gByT9qI51PwCPZEqgjb7mDQ6nSFOLUBWmQhqGWa9rYVJpJ7RoaFo2VG/KA9JIM54R+dJhdB/7en5npQegI9TpjAz5JJ7jQyqKomV7MrnYBOeZdBa6s/4Z9yDICNkqCFlAp2vyQVV/s9YDV20Wnu3/1rZo8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PUJAUs7H; arc=fail smtp.client-ip=40.107.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PUJAUs7H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbxkY/zbR2GBFt5o7jpIi33zNjZ98uGZbCSMa8REzqboHdiV9sA4ibCMT1KLx3OS2665T7g7oQ6SjJ97dA+c2cz7slswIah89khN75RIRVRSdjWNcF4ozDCiaw7gJZ0dwW6gG8E1AbuRiIMeEb2SPzbNbg8c15p4dZXNVPPFKSPpOuDFMG/Q/akx9iB03KO5iBGSLCGwY0Q7Z0QkLCd9xR4i64gRpF8uKIb5m4tpULBbml+TOt7ZR98nLyfID8aqvSr9ueSZ1IPDbCX/T3BOZsvH6CS1gCa7Sh+DJsfM8jkZb4a5BOEmPymbp0nTamgJi8UERpHaTgDvmgGPzb9AUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCTzeVCueVQat3aXTSDH32b5RAKTyERMUIq7yLsEIGA=;
 b=e5X1jJaCVjXqVoXvalJMp4l9pgBLG0Zk6lwLxzzbMa+C9eh9CFumloECeQgIDrDfA34H5lLyWHyH977maGLMRyeFy1miIj5QHFDSEVZ8yoRTo0yO7zKg33PvaKR3WPhLJXtBXzb8QnUIV9pXO3ZQ6tzI+CmcZWH/41ir5OlLMVzttb/ZzlTd8SDZ3Wjdmum8rJt9Qe31C65uNU7sDGnRaxlcDUrpeSVe2+6RM1+k9ZkQZlv0zVbvAcxY2JmK1YTy3p3EKQ4euz1o465RfAo89xX/AmM4FA9v0m/AjUMyr19T3DFxZI2DDE/zV18iCDctp3S4E9jZEIaVf4xmXFimKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCTzeVCueVQat3aXTSDH32b5RAKTyERMUIq7yLsEIGA=;
 b=PUJAUs7H+fna2jCReODzLeRanV9f0Z6g8yk8abfDS6pPlyFYcjimt71d4fCcpx98lIfi7USvXBtfQ6MHaZ2LE3ySc+OOE7qSimoIteifZ5zhFWRxSgnO2iI8YnmhQW/UvaIMJHvp8rf4slKVCC2eT1LgaRd4TWTR5H85isrGBiwVTJ40AOtxMf4PTZJP52oomeJ2BtcsFhZrh+8fkXSkoPnPMDkpqsi7lpTSQUv24ICgFAd8VJJOheTSul3VFxfSWoXjOy7i+zW6dz4YgIs9cJJiLsC/S624/Z/+onnnVpsnqn/Wgs00Qkqk8wwKay9cWOIziPsBMdREaDTmB6OFmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Wed, 3 Jun 2026
 11:04:32 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:04:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 20:04:26 +0900
Message-Id: <DIZD5024DWWS.2YQP7Z8FOEURI@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 9/9] gpu: nova-core: gsp: enable FSP boot path
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-9-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-9-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: DB8PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:10:110::39) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c11b7b-d719-48f1-3af5-08dec15fe3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ojaByL1hi/Hc+kiFPE699Cu/CkE+0CMgp4Kd+p+7THyVvpWCtuWQmwNHolhx4hzY+G+AaVUFy1hfSjP5w6TnCdFKMHWeotV+qNoC0hTbH16IH+iTggEukYdFQ0Hbq1YBKI3LBIJdjESjHeCh9/nKPkvN5thAwqU3LPtUXy2MCYykQrDvqOKqMGe1Wjsn2xE1OrCYsPCmCOyGfZ58f32BbU0+jUEUIJ2CgUAzy1n02bnwidJO22YuW1IEkXpt3FZOXwjCPrDu9emiGWhXNG6dN2slkYUNYuuKSvBUCZlX3EcoHAVXr+gZ0zcxCJ6CIHUxqQUWM/flnIKn2Ae9Jsw4YKRWBn+D7fRUVBTAlUh8Kwlp6R8LiPGyrjQnxd6RxTMu1Nq5Ex/N0XGWY8JSWkmoRKeUd58+Mi0rebPTiM/n0dfW9mLMlsQhrN2bGjRvP1VoSKMM7v8I0OHnJE9TqTP53Y8jXiMdlG87Av6ScjocxXJ3QxXMNsdlobZIo50P2fZ7HvfviFXWi0vos4tjodI70feSsrqCwfWXvFHJikBCkX9UHXejgr6Klk826+GQb6/GqLntMTFLJICIinr0dgQJ0uyTniCA9Hd8HQ2NQzF2bUsLMNZ+9D/6fgluFsWr5Q3UZnie1kbSMkya4lfmOkQTi4PSNw9u/cKXSDTdSj9223AezEPJyQhf0pfhtQt0+nJL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkR4a1BkQXB4NjJPOUhudHZ4K0dmUzhUaE5sMnFJb3QxRCtqSy9WQ2JRR2U2?=
 =?utf-8?B?b1VPVDN0Rm9iQ3JvM2hVM2t5ZW1Wd1hHeFlZRGFBMjdMMEJqMFd1QUdQbzl3?=
 =?utf-8?B?YlYxZlNzeHR2emV2a3BYakUzNEJUSE91MDNOYkNEcjNTSXVmK1IwN0hROWM4?=
 =?utf-8?B?SENtd0V6c1FnRFJwNFdncDFEMXBRaHptZFVJalhFWkdxUHVuZXVsT0c5cWN1?=
 =?utf-8?B?RERIS3dPcFNucnlsZmprSDBENk5RZmN5NjllbUdVVmwydWZ0MnBjSkFDSUp6?=
 =?utf-8?B?blBIUmhxekg1MG5hS1Y1TG8rMTk2L1AxMDdxSUVIb1AwUTRVZ0VDUVQ0TlFZ?=
 =?utf-8?B?TnRUKzk4TzkwemJ1RjVxdUw3bGVXUGkrbGIreHNDeWR2Wm9FVFZhYzJ2bGtw?=
 =?utf-8?B?c1p1eU1rc0Fadi9SSFUrM2JTMk14c1BaSjU3alRqSE5sYmZ1RVJOaVhDTll2?=
 =?utf-8?B?S1c1bzNPQlRBTjVlZXdxZjZtT09nQXFjWDVKV3BjdUVPbjVjVUVtSEdrQWxw?=
 =?utf-8?B?K1U1SkhMek91YlhwR0hlcnNPNGd4dk1UN096QVU3VURFbXRhVU1ZT1J3UUVl?=
 =?utf-8?B?N0ZIdXVhZmZnQ0dxcWxhc1RHSUY1SlExY3grT3lUTVhuOGZsOU5vS3dXYTB0?=
 =?utf-8?B?dEh4dmZCeEpCTHNIamhRc0NZNE5Kd2hXZklGdzhLaE9ublNTUGNBSzhTR3VZ?=
 =?utf-8?B?V1pBUlJJM3puUXUzWEw5dGxvSlA1L0RBMnhoNG9TS1pVMzNsdlB2UmdnWEtw?=
 =?utf-8?B?dWw5bk9iQXNsVVh1cUkrSW5BL2ZRZXJyaGZhQjBURVpUekpkTXI1TVAxTmtk?=
 =?utf-8?B?T2lEcEFsZm0wZi9JZVJCNGlYYk9WNHhZQVoySGtFcnNuS1VWbzRTaHVmOURh?=
 =?utf-8?B?cnh0TlhpeXhOa2FHd2pZRHoveEEvb3hjZVI1OFFqWHZGcTkwNFAySGE3cll0?=
 =?utf-8?B?VDQ0MnBBcG00R1h4K3RSZFYzT2dOTWlqYlhlaWlkMkRhM3ZjdWFDWVAveko3?=
 =?utf-8?B?K1BNRmhkOEFxUjUyNDVFVTlkV3lXcGhYQ2dYNEpRNm5uVXh6d1NrU0VFL1Ir?=
 =?utf-8?B?R3pPOHdBRmwzQ1ZaS1kyaTNjZWc3MEwrcXJPN09zQnQvNkxQN0RaL3JLbUtt?=
 =?utf-8?B?QTJWODFSN3JpSDlwelRjTGZ1TjJReHR4WkswRlZFVitGdUl5TGMvWnByMkt2?=
 =?utf-8?B?Q1UxTTdLTUNzZnRnNllhK0dFY0paZE9kaG5YWE9tR0NuMGhvMXdwYXBYNHJk?=
 =?utf-8?B?dVk0SWNVWFA5TEhGN3B0NVQ3cE1aSm9jT2lUeFlxSnd4RUxqWGlNR1d2dnFD?=
 =?utf-8?B?UEgxWTdBTEhsc1JjRzB0b21JVFZqWFBKTW1XUGZTMUdlTkFQay8wK1RocUJa?=
 =?utf-8?B?ZEpHdHprYmJzc1J6UEwvMDBJdHovWnlaOTRkbWMxcXRaQVV5OVNuc3o4c0dQ?=
 =?utf-8?B?NUxKNDNmVkpuaGVONzF6V1JpMjdoeTlMWldLNUk5Y0o5QlRaeGVoSGtHNlVa?=
 =?utf-8?B?aEJwcXViRUdEZUE4ZHlnZzcvTWhaS2lBMVdrQWlkbTlvbjVzMjk4VVI0OGdB?=
 =?utf-8?B?bmVVMUM3WWZLT3llaW42UzI5Z1g3UmFQd1FMYjhpV3ZxZEtqVWM1a3dwOTg5?=
 =?utf-8?B?eWpxdXhTTEZlUlFsZGZ1bG1VempnczRQRFFuU0hHQ0xsSHlSZHRsaGlOd1ZX?=
 =?utf-8?B?aHQ0S0xhT3JOWjdvYjZOQnFucU5wbzVxU2FodTBWRmlWRHhIcWgwOEVwR2Yx?=
 =?utf-8?B?Z3pBd2MyNDEydWtrMy9LSUVwSENPKzNqSVhISUxoYmdRVWErNnNUeXJKZTVh?=
 =?utf-8?B?UnJjbTNrZWVXZG9EQzlyR2toOGdvdUk5K2NMNzYrWWIwK09OM2gwc3o3NzdG?=
 =?utf-8?B?bnp6cUdPL3lkR2dUY01BUEFRelQ0RnhWLy9ZcDF3UDVUK2RreGhhK1ZlNDJt?=
 =?utf-8?B?aXQ3U0puKyswSWpNanNWSHZFams4d3JyYUUrenNwRUFIUUNCcEpPS1hRc2pV?=
 =?utf-8?B?Z3VXcWNZUWZaZGJGcElNV1ZHbnpHOEMrVDVUMlVJMHlvMDFqcTJoUVJXTHA3?=
 =?utf-8?B?UUtXY3BNOEJ2WkZtL3JxU2RNRVYxN3pOTFE1TGVnU3AzZnArVDBpZ3NsSmtR?=
 =?utf-8?B?akNsdCt3MXUvblRWeFE1NHh6aUlqOXlqN3gzRFlSckNRcmpid0I3WUE1Z0wx?=
 =?utf-8?B?YjcvQWFyRmU2U0J2YnMyeURjQ01qMXZPcVY3MjQvQU51ZkdOK2pDVXArQWpU?=
 =?utf-8?B?b204M0J2MHdsZHpGQkhydkNzWTBZV2lyQVZGak94SjFhei83VmhEb05TQnc0?=
 =?utf-8?B?dngxUDUwVU02TmVNNEh2bko4ZWxBQzFpN2d0OGJmeHZybXVWSyszbVRra1dV?=
 =?utf-8?Q?mxmz8vmyrCSE2QrTdHnILi+oLZMqdgqV8Umojpl3Yu+WG?=
X-MS-Exchange-AntiSpam-MessageData-1: fiqLhhBh+qS/zw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c11b7b-d719-48f1-3af5-08dec15fe3c9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:04:32.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6vu8+qgx3LKvOXZqs3cEdWrGXz5QAHKjYSxlcggZHhTtnZQ3xZFjUgYdctgoY3nnZsUXDfspPqJPlkrmJ9H9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652

On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
> Now that all the elements are in place, enable the FSP boot path so
> Hopper and Blackwell can boot.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
