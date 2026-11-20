Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152241;
	b=5ouAsiNNa20Fw7h476FhG4jm8z0yDu1bU4izwBitZ2F1Wwsn2ILjLvwKTXO/vHhY1VLY
	 6Uzu1T5Q/A2/Ce2fufpja6CSTpRMLxPbIV60RMaTj6ADIh1XzygJFCdYBahOUq/yJPWXm
	 d2C3t3XYB5NSkpVXWYMCOfoXoMurqr0Sd8aFGkdpvbr30vyp81bBdgDOlLM2V6hzuxtxl
	 CFTkTUU00pSxjsKLeNq0w0KpGA11KUM3EBLhIKLqJS7KlUf2/+AkyX+ycAcQO/c3GwoQ7
	 BmZPR7MNrWU1J/gBcY2BFX/ZMaC9EjgSYPJ2bgGj9rYbDK8CT7dMVLvwQ0VQzJbbm4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152241;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=82Ezb1iHS82cHn6gcyuORmNm/Rhou1S4K+jkD7/utBs=;
	b=JtsjDsOyiaiJyqDzL+9Gj/+6pM76aV8vTbM994+erv+1iDasQJg2jqckndIP3ulhELJM
	 MbvdgusPJVk+wuQLIholNRP9ox/IpxIwDgOd6MlYiZ1FjGeSyb7axEYdWRFwdqFmfdDhn
	 dvcxq3B2RKL5vhY17SYAR/RTtbUkyjvp7nBQfccPw3L6F4I5oUqtErRyjAIQ4fnQsdSX3
	 ugzFnu/2B0/nbbGHXFRMf2WgOaqHt+g3ok+0ryV2nO5ptkfXBDNdL/sPn4KuWuBDR/89B
	 TbK9QWDD/m6u9AYYHJj4i9Cor8ngX5KanJuMJSsVtNoxYgxtL4ysSVhFelzEp8639AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gNQO6N7G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.53
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25109606A320
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 05:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25109606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gNQO6N7G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXGDeLygaCUlULHEXqqJIHclwGIwVM0zWyo8KFfEqCRa1eo5C1St3NHGv8prT7c3zHcoNxV+qTQK14JBGKQJ1IQF6+dqn0dYlMiltWsd3HhYIWGjaRdJUO8yV14yqExRa8TnJDsGPRV51rJjlfxYBzROYFv2srvdaoIeke0CtWCstFgyRP7Gi7Y5yqXUuNzM0SakQ9mytE6QhH5UR0tu62us05XCL228kWeG30GMDC/Ys6DxMAV+kzdhW1rM+wuPWCVxYGfY9yzSw2HFAGQ9s1Y41idzuBd6QS+bWLw3OVSJq42HwOr/AtF+5lZyC9YjxqMC+Ju7/QdYvvs0+jpT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82Ezb1iHS82cHn6gcyuORmNm/Rhou1S4K+jkD7/utBs=;
 b=UUo5Hj/TMdkNqagdAbM1cjKtYNsfvsgfvkTFhWwoeJr4ai4/I+Nab7HlNibOhILrB3AsJtAM7K7wRSozMIec/FarBRia3UBmgQ+YWnSymjEqcBo4FZBVHr2nGdg5sOq/SyRJ6G8nvzWto4lEU0uFCFIsFcjH4Za+2Z0t1x+XHZnYS53D8C/CO7okGRpcGMphGsSa3+93p+R8qVTE2exfyKDKUIUGNM6Aa7XStXijhLJAv81l32J/zzxbHCyxPTmvmAIGY4ORckk1TCSiGRMLDc7Us8glUMR86JRwgUcOgV+DgMoxXqK9R3iDS+E0vuQdGGDba01p8OsbkZ822XeZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82Ezb1iHS82cHn6gcyuORmNm/Rhou1S4K+jkD7/utBs=;
 b=gNQO6N7Ga468o8hZHDZZLDfZwcsLErVIOeNsj/s1uKGTLMmgbGexJxiJZEbHbSiwxVedJXGg5Gd2UYHmQZWHfYbioyUlwidUWTICD2lOY+zhTkVdKoL+oSSFC29pw7wLmkHwFxVPKq7hsh+pncOvCmOBmAZ/qDxda30TI2xbsihfQ7o9ThnKTz86+RXJ1AmxsSo/ahzG8iEv2bPX/tMZh3+KqDcKBNaMbQx56ElwdNlhryFkwEXDT4Q0FWkywxtrY3K5Wor5ywJgE+/mv5BAmIDYOtNOxvS3TYQwOzzNnYmEnJOI4ZH1as4PDc08W478AFxg5INMeaMFfBTuE8Wt1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Fri, 20 Nov 2026 05:23:57 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 05:23:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 14:23:52 +0900
Message-Id: <DMZSCUUQ58NN.P7J7Q8GN3VKR@nvidia.com>
Subject: Re: [PATCH v2 2/7] gpu: nova-core: read GSP heap variables from TLV
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-3-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-3-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5bbd0f-d8a3-48d3-fc7a-08df46c6794d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|18002099003|22082099003|3023799007|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261022105027099003|261022115727099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	SmFbTifFP67LN6j25NlYVmllna4e2AFFavs5j0Ftus8BYTl4jRXD1RU4iAo+viApOt0/vylzE5+T6bHcF1ZUSfj/oiP4Yp64zRUTnzemJgJ71cojwaF3ukE5ndPhMtgIwy4QPLdRUkKZQFVxxVwCZ3pC+Yzcy2YAOvXJKogTnG/4zNERy5An20JiWqKZquK6ZkyUFDzLlOff3BVMDrOdoRJm7w+H815FIr6PoZFKVwoxEqKffaSE4oZ0YiEVqMWFTVpZhQjvQSE9qONQ35Yf63hXkV3JCULgCstJR5UgHfGVt4hL0VXWKeelFIGvvXxvOIMuoKsNLZD2euR8ecjXgOO+oBLmj4pfweUPVNHVvO+hW0Cuv3ES6XZShdHS06widrv9YWtOWjZG/c21TxhEtq/7owp6azIgHdpI7ejbFIRn1v35Xh8A9Xw3h1KwMtkM5Bj/5EaJ6zirl9OznbZ+QwCwW0xPCedY3rrpu6mS04ggWuAwbu/y/cs/MaMsuo0vd/Y8PJaNkanFV+n2W1KYfpt/Pyqm4ziP9O5Lp9SHzRLB8frOAEzZfR6/OEQosZen+rmCesBXx5zOflVsO8YewVGUwjh0XIQ+uZ/hzY+y5nz/DkQUHLhv5o4gvzBqkvmi8czYbx/GS/t+0wZdToZ7eyZQoSy81sw1sv6IRuFLTYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261022105027099003)(261022115727099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3VQK1BkV3FEMThIRDJ2NXZzTTZKeXFDSS9nNTcxVDJUWFo0ZFJhVFFLLy9x?=
 =?utf-8?B?ZFRzajlzWWgxY1VmMEs1SFROUDNmTXV6MnkvU014cUk5c3RFQ2t1R2dMU09s?=
 =?utf-8?B?U2lWdUd4S25rNENJTy9GbG5VVEVPemF4N3R6ZDcwQmZZYi9YUElYdVZFMk45?=
 =?utf-8?B?bWowb1o4NW00akR5VDdidzZFNVBCVXRQRk1kaThKTEM1b2FnL2l6eWVLdUNI?=
 =?utf-8?B?RnJyTHdoQ0xBWU5SQlFaV3FWUUFJdEtrZkk0NEx6bzVwL2tIb3hHN1NyYzdI?=
 =?utf-8?B?ZFBuanZlS1l3bVdQTTlYdHdvZ2lhcFhUQ2k3RS92QjNQUmgxNFhVVEo4TWZu?=
 =?utf-8?B?Q0VwSTcvSzBVeXYyeC9XOU1SSXNsTWhBVlNZY0VJcUZKR3NMVTZnbXNVelVI?=
 =?utf-8?B?MGtFajIvQjhmY1lGZmJVZmIvdmg2OUkvWlRtSTFQU3JYU2NlZG50aUJJYjBr?=
 =?utf-8?B?U1FjYkE0S3VQQU9zSkFFcmY2U1N5NGhkMHVQdDE3M2l0MkxsWkMzemM4d1pa?=
 =?utf-8?B?Z2Rod2VkYytaS04zQXZFT0c1UUJJZ3ZkSDh0NmxiV1VSMkJnbElkN0YyYk13?=
 =?utf-8?B?dXpYbDFNelIxU3lac3pZZ3FwcXdXWGF6UlVTL2dJbzd4QktTY1hHMjJXcXl0?=
 =?utf-8?B?WkRHSFpPLy83WitlbklYUWU0Q0wzUDlPVkR0ZTVFUERMd0Irc0tiWDFtd1hQ?=
 =?utf-8?B?OUExVVI4MGhWTFlGRkdKbFgzMEJaZHpMeStKS3N6U3dOK0J2bnFlOHQwVVZW?=
 =?utf-8?B?cm9RVFVEcUVJK2pDYUYyeGcvYmZjeWpJZzdQTjNFdXpXeVpiSlJiQWdtSGlk?=
 =?utf-8?B?U0dUaUM5cHAvUlBYTTJ1dzY0NDNJTVZocFR1OW1lT1JkTUxxSGsvUUZsM1NT?=
 =?utf-8?B?djBKbEl3QU9zZnBTdjRFdGRzQ3RHaDdXNnF2YnA3YlNjL1RSNVdwRFAraENs?=
 =?utf-8?B?a2wwSm44SUNGZ0ZFNGt0aEl2NHc5R0VKVFhzMEhVc1psdHU1OGFIVzN0cWM5?=
 =?utf-8?B?ZTgrQTR1Rk5iZlFZTXZDVDNPVVVvYUJkbUppR0REdVVTaVRvU1JLNkpzT1V4?=
 =?utf-8?B?d2Vwc3VTT2praC9qQURaTEJ4bE15Mk1ad3NMV1FtTTlyZGRWdkpscGtXa3Vy?=
 =?utf-8?B?ZG9IWjNXQzBFL1NOcCt1cG4rd1pWbzVQbTVUeTVtdlRGZ3IvVDM5U1lRRTh4?=
 =?utf-8?B?MmI2OVdJVEdoY09DckdJa1V1ZTcxWU1iN0FaNVc1dDJrLzBMVEI3YTZjMG8r?=
 =?utf-8?B?NE5xNlpwbTNpNzdXdnY5UkVkckJNaElydFpTdXdiRzhZbVIwbGFBck5RMU9s?=
 =?utf-8?B?VUQxZ0pURU5JR1ZoZGFmUmZrVWlNVEtCNkIvNW1UQis0WWNlNUNmQ1QvWXpN?=
 =?utf-8?B?MG9QYTAwaDZxTTRZRllhQTl4OVZPVEVSUkI0L29TQTcrakdxekRjVXQyRXVF?=
 =?utf-8?B?SGNtcGl2QlN5WHRhbFJqdERmYVNTbXVKcHpWKzVVY2dtYjBMamVGaDZQOXgz?=
 =?utf-8?B?SzBJYmMzaTZia3ltTWpMNjdnYzYyS2h5RVN4WFl0ZVEwcW1STmRXY042M3Zm?=
 =?utf-8?B?aHJPRjkyVGxCNHpDNUkzY1FDSUdzZEFzak9SeGJNZ3Y2WW1CeUR1NUkzMHll?=
 =?utf-8?B?c2t5dlQxVXBlZGpQQktPUlJUbytxWTZyVUZxU3ZwWVA5Um5CV3dsWTdXTTZl?=
 =?utf-8?B?djlSZFVwNXVudnRDKy9GVXJTUGpqSk5sTnY1T1VwV1lWd3JzRll3YTNuaFlV?=
 =?utf-8?B?aGd4VkgxRGt4bVpEMk1Rbi9SMmNzMVA5cHkraHRjY2I3VnIzM0NBK2hhNzlD?=
 =?utf-8?B?WDVrbFZoK08zVytubzZZMnpsVklJejA3c091U21idlhvaDZkVXo3TmRiSzNw?=
 =?utf-8?B?TXNGcFdBNTVENXpDRGJ4QmxQS252eHg4Z2VnNi9wRVRBOFBxMGVCQ1h5S25M?=
 =?utf-8?B?c2RrNTUzVVdIMm0yODZtZmNxMnhHWEJ1MVVLY3k5ZFU2bjl1MnNZcE5oNlZW?=
 =?utf-8?B?SDcvays1eTBGSG5KSU1jNnhpK2swTndqdC93emlMQW1xU09NT1JKSDFFMWtZ?=
 =?utf-8?B?OVpVdlRhbmkxbWNxQXF4OWNORTI1NEFIMm0vTWM0eGs2eUtoOVVjNC9GQnZp?=
 =?utf-8?B?N3ZCQjQvc1pFOXd1STV5S2ZBbjQrWmRwRkhJY1pRaVpIMWd3dDczNzNib3d3?=
 =?utf-8?B?QzNMeHJnZTF5c3JDQ0ZDN1BoUDN0R3hkZHhoV2YyMFJkODl4Nko2L1k0b1ZM?=
 =?utf-8?B?aHlBaHJyWUlJTENqbjRiNXlRSjR1SENwNFNwdUN2bXc1eVRsMEJtUEF6R1Bh?=
 =?utf-8?B?aUx3M0ZvMTd4aU9nZjNBdGRqVGc0b0FEYkUwSUUyTWt4Szc2MVpHc1YvNFB0?=
 =?utf-8?Q?dyawNYzL4/FM5CN+fd4zyH9h3UknZEdo1uOpLKjJ1/Agf?=
X-MS-Exchange-AntiSpam-MessageData-1: 8PBoeBu+ATNgNw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5bbd0f-d8a3-48d3-fc7a-08df46c6794d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:23:56.4104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rk+HxEULf+7Gl21PTcMGpKUsa/PYdSKerzNpM1s2OtUsLcWP7raPzz5qsCb/XyjFsoTNpXt6sWR3IrqABeIBFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> Update Nova-core to read and store the new heap size variables from
> gsp.tlv in a GspFwHeapParams struct, which is changed from an enum.
> Also provide a constructor (currently unused) to create a GspFwHeapParams
> object from the TLV.
>
> GSP-RM firmware TLVs (specifically gsp.tlv) that are based on r615 and
> later contain an additional six variables that contain values used
> to specify various heap sizes that GSP-RM needs in order to boot.
> These values are specific to each GPU and RM version, and are obtained
> by scraping them from the OpenRM source tree, just like every other
> TLV variable.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/tlv.rs |  1 -
>  drivers/gpu/nova-core/gsp/fw.rs       | 33 ++++++++++++++++++++++++---
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-cor=
e/firmware/tlv.rs
> index 6a9b318454c4..024b456a0a85 100644
> --- a/drivers/gpu/nova-core/firmware/tlv.rs
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -258,7 +258,6 @@ pub(crate) fn load_file(
>      }
> =20
>      /// Return a u64, from either a 32-bit or 64-bit little-endian tag.
> -    #[expect(unused)]
>      pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Result<u64> {
>          let value =3D self.find(tag)?.value;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index c396daf06f1e..a44550b70d44 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -37,7 +37,8 @@
>      },
>      firmware::{
>          bindata::UcodesImage,
> -        gsp::GspFirmware, //
> +        gsp::GspFirmware,
> +        tlv::Tlv, //
>      },
>      gpu::{
>          Architecture,
> @@ -65,8 +66,21 @@
>  /// build-time constant, so the driver chooses it, and this constant is =
the one copy.
>  pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D GSP_PAGE_SIZE=
 * 16;
> =20
> -/// Empty type to group methods related to heap parameters for running t=
he GSP firmware.
> -enum GspFwHeapParams {}
> +/// Heap memory requirements and constraints for booting GSP-RM.
> +pub(crate) struct GspFwHeapParams {
> +    #[expect(unused)]
> +    tlv_gsp_fw_heap_base_size: u64,
> +    #[expect(unused)]
> +    tlv_gsp_hw_heap_size_per_gb: u64,
> +    #[expect(unused)]
> +    tlv_gsp_fw_heap_base_size_vgpu: u64,
> +    #[expect(unused)]
> +    tlv_gsp_fw_heap_size_per_vm: u64,
> +    #[expect(unused)]
> +    tlv_pmu_reserved_size: u32,
> +    #[expect(unused)]
> +    tlv_non_wpr_heap_size: u64,
> +}

Sorry for the review delay!

nit: I'm not sure the tlv_gsp_* prefix is adding much. WDYT about names
more like:
wpr2_heap_base_size
wpr2_heap_size_per_gib
vgpu_wpr2_heap_base_size
vgpu_wpr2_heap_size_per_vf
pmu_reserved_size
non_wpr_heap_size

Then the type of heap (out of wpr2, non-wpr) is clearly
identified. Some doccomments on the non-obvious part of each var might
be nice too (e.g. that the wpr2 heap size computation is dependent on
whether vGPU is on or not, which is why there are different vars here).

Other than that,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
