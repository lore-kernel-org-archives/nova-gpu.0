Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5F2773C3
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276538; cv=fail; b=ugA6FE5hlGZPeAeV6e2dBUr0gB00k2g3/wqD5/AD1Ner6V5wyMkMdhi9/2PNZE+TK3GSjmB4uvle9giGw8CU+eu0P5gvglRBQo48nzxkW9Q+1lXRCq6xeNoALo/Ryw+F7buvT7VutKO4WN6jr1ch9FN9k1+O6tAAkxCKDozj8zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276538; c=relaxed/simple;
	bh=dmkN68cSOVvldJ0ypkwYYRvYe9bNEQBIaj5YvsbBYi8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=j/OBu+xCRtZGmPLxaaDgSUz1q4dyhImJpTTc7lnpCscQb2Rh2n7OTCbRLxecOXRATq4dVtViDlhStpe17a19sxJbkNvkaozdA4mANcFy4ueSEmisDT4h/nQuHTOBSGPLJTUF8TBjuhQoSh0Hxrms1QvWLBQ6xKMLL1nlgIFDVJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dzqIg30o; arc=fail smtp.client-ip=52.101.53.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dzqIg30o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjXeMVKNsJ4FoMUVg6hjEFXs7VvSd3TzH6BfBAWPvZLFn3N0QtFcKGh7uzCzhAiV2FevyTZ0KNSR1/ApTLkz6/M328ck2YCXZkP7rh9pfHcz+VFIszN3Li2MQm1CAFedIR4kaVdUKQfIXSQD4DBuUDqIupPgdE/nlalvV1X+fIZ/TEIUpo6sypOK2hgouxJMs3CSuO2Q5iabdOrNL4qoJpcNp1MnlEEGnEjAsrMalz/Cd5foWx7blGoOFd1wOLu/oOgFpJpfAHb5lgCo3ofV6hN+qb5moAEzrk3iMG+6i3rTI/q9qaBL+xT/F03nz9jS59mSzPG4ibWq4b53Oleemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUT6P02hVcspJtXhVcQxZ7QdkyFeKx1XdgjsTn0SNTc=;
 b=wNKUWVPR8LcJu1s/UtCz515DSV8yY3Uh67SaRrGoq8PoZjdWCnYgqLYbafqhRt+kZDFiApdtJFHUh2FooOuOPrkXmQbS9h/QZ7+dvI/hs/fBfaGScgB7VJ10WiTPIJNz6X8TeLg6/fY/lWAHkWYe+wVMobsDIH3GEw6pbQCAbIU4ZPGx7ynbMBirNlN3QarBltvTGuHnuC29IOWp6PbDHoSGsVcApx6AudaEahtYnnTySzkrh2UwfbjySAFsDyfxMIwandpfPdTB9MBF3z95MWChtXfTDcO17vY6lblRTvrLhABR34bxWKqHCWHXInt59t7UC8VtgOzyems91kKBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUT6P02hVcspJtXhVcQxZ7QdkyFeKx1XdgjsTn0SNTc=;
 b=dzqIg30o8qY1GNHoIjpq+p7SC2WwTVc8PpxpQq9Ub5XLW8W3qmIWU7/UtZMu8dVExYRQqkqHseEqktwENz7R6ELRsdb8jjT+/IKxpjlWICla1Bwpzrjwl4Hz7UhzImnqZ8LDXzWpkjplomakoeNycHp4vPZtUz6EA9yZX8EqxQJw3ShqtQHJ6ryCwcUnCnGuOhs5EWn6evARRq7aCnvGW5Pjyi0KivJVKO+Hny0AKhy/xcKSZFznmmKSFdSDqak4TYtCYjzlo3zqtLuNEVcfkHm7Vve3flNu8iiiYImjW/cZ7/GkZ61OHnM+ParYdEQfGYvTPPq56jGptULnDQ31qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Fri, 12 Jun
 2026 15:02:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:02:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Jun 2026 00:02:04 +0900
Message-Id: <DJ75TUE8DMNY.3I4RVB7WCTDJE@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>
Subject: Re: [PATCH 8/8] gpu: nova-core: update firmware module info for TLV
 images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-9-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-9-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: 806b3529-bd7d-4415-ca2b-08dec89392af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	gJH5Dq4fsaS5QJQFANKLwUSilSPzkuM5hxiMJ897uDLiDottyRtjcWdfj99Bb/D3Yevr09igEZNauKKr+xuWWOBhMKIYcRwKOzY9XDVH58BUJjTShuUQ9xSewCwlKs5iTfz/utzMrhfCtLXifrlzExGYR8WaLqa+D/2roK6yBhFtGiLf1kXNBPnNRy6ffxiqL/UuognVwr2x6wzO6STXgO1Ej2NWCwsHo88ucyIW08g7ViVfGsP9i+mubsLl4wMC8peA/ZZ4ISCcncih5OwNKXGyPggsnjXujLyggIRJ3r/gcj3a5ODjbBIpl+BQGP1C4/JjdXNXVfxeEgpKnIuIkvEF2fuVcQiUp6zdDotGMO3pBMexp/B/ffPtaRXHz0P+p/XBtTTGBoQqcwUqSya/0AJJhi+mebA/De26JhOEV2syzbgb2f2LCXFt6kNnV7xIZKzuoz2cAbAGhHu+deehU/t+cQGSFhnQnRTlgK/AZmh1mdY56YGkDAQMB0kY2fGB0HoH1Wif6xjjbDlADYrdlesKAK2fgVrEyzWsISu1khXuEtix5M/9Eiq27Zwi04gRN0IqE5jOYcOkIaQ00RemoQjtLwfsp8GGH3572X6qFThO1YQA8BvmDOQfBA80x+AbLsaKSgCccBtcWkqE5DpAQ4SvODgEssHCvuZhRGuAM2wxaiR/osMcSNPqv2xgItuC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjExbEt0RzdKSzBiSEl5V0lXM3p1bFQ4M1lsMjJmUGwyY3dsalAxMWx5OW1N?=
 =?utf-8?B?c3pqQTd0UWFTM2ZJcmNIdCtlT1ZJNXRoKzd0cEJBMFAxNGVRSUo3V3JsYTRm?=
 =?utf-8?B?MDU2Yk9YWE4zc1ZuWXNtaUdZUS81SmhEMC9vSXpwd3pKRjQxQ2NZZTgwZDVl?=
 =?utf-8?B?S3lVVG9yYlY5ajZmQnFlQzdjYjhTY0xWSytXdCt2MCtNTnhNcEhyN04wU2hK?=
 =?utf-8?B?cEFmcFVQNkt2WFpQM3hRYTdJa3VjTUM4a3ZSc3JtVUg5V2x2MFJOWHY1a3lo?=
 =?utf-8?B?Q1JDTWkxRFRUWkNCWS9PVUwzdzZqMTMvaXVTL3ZETEQzWXhuNDh2aW5aWU9B?=
 =?utf-8?B?c240aUxvWS9JS24ybGRTRTRpTTZ4aEdMTUZhT3I3R3lvT3FoQTdDV2dYR21n?=
 =?utf-8?B?YmdONjNrSWlZVVhteWlYQnlid2h5b2dZbFR3b3A2MEhyeFBzZGZESWNIc240?=
 =?utf-8?B?Vk5Zc0NIRWc4OS9RWUhoNTlpMUc2VUYxenpUT05SY0lqeGJ1WHFuMnFlck1y?=
 =?utf-8?B?WVlKczdPMkhSWDNUUnA4WUNUVXJRSW5wZ1dJRFg0ZE8xcWlkMWIzT1FMWGkv?=
 =?utf-8?B?RHBreEZibGp0TzBEcFZaQjFRVFJ2OVl3cXFEeUt2UlFzeFo3eWpuWU0vblIv?=
 =?utf-8?B?M0xtL0lXZ2taa3l4MEVPQ204bnA4UGlCODkrSVFSYXlycSsvQjVEcWE0T3lh?=
 =?utf-8?B?TzRXVEJyUndkaXlYU280dGs0MThzTGo2ZUFZYWh4WkpVSFgwaHo2ZEtIV0VP?=
 =?utf-8?B?WVZqT0lKYklJa09pa08rZVFWSmhBWXprNi9DR05PRmgzMEJ6Ti9iZWVyZzNk?=
 =?utf-8?B?TDBrTFp2R2FYUTdQSEVOTFE2L2lPYUcxVUE0V3FQQkd6SE12THdFY21OSW8v?=
 =?utf-8?B?cnBwMUxrT1o0YlRJMWRnZXBtQ2g4M1BkYTZPcDJJVXUxMWZGa2FocVo0OWJL?=
 =?utf-8?B?SFdRZmhDS1RqMHpKdTdtUzBPZVhkUG1DWGhVdVlHRDdaT3FSemQrUm5MU0Ny?=
 =?utf-8?B?YUhLRGhTc1ZBWGdoQ2tEVUlyNEtyRlB1Z1VRRVJNRUxudDJkM0xYeUYzUUNO?=
 =?utf-8?B?NFEvVjNKV21OZTAvMy9JR0xIZGNGbUowcmlOS24vcEh1MTlaVzRNUldiV1Qv?=
 =?utf-8?B?eUNUTlFIcFVjbG5ZeFdrdHhwN0c3QTFSU1VqWTlsbStrRVFtZk1KY3dXaG5T?=
 =?utf-8?B?emMzUzBSTHl5OHdXMkdQWTVPaURzSXlqTFdRaVhaV0thQXA0dVR6VzRySXJ5?=
 =?utf-8?B?ZVVWUUI3NmpwZW5TNm43MzdPNHBMUE95OTVtNkVWNk5CaThYalZOcWNyZW5B?=
 =?utf-8?B?V08vOU1Ed1VaZHBnUUZBYThPZ0RIRjdrWmMzdzhEWmY0dUdidVhzcy94OFdM?=
 =?utf-8?B?T09kTk5YRlBZV3pVcDFOZTlUeW9BZU1zSUdNN1hLNmdDUEtTWEtJTFhabkpW?=
 =?utf-8?B?ZkwwVXg4YXAzREIxemFydzNSN1NPZnVaeE1YcDlwUkpTM1V1RDVJVUpETVJN?=
 =?utf-8?B?TkR6WVZIb0tDdGZRR1FPdXREVTgvNmhGNnhJcExNUmtvZVJKZ2VMZVQzQURE?=
 =?utf-8?B?OFY1aTFaakRxMHUxRzR6K0FycUxKdGxkOUVQS3pkTW1DVWFObThlMXhDQ0xp?=
 =?utf-8?B?Y2c4Q1htWVNHT2R2USsxbDlQUHB5enltcitMZ01lVmFTQ25tNTBGajRSQWIr?=
 =?utf-8?B?SFd6RDN0RHoxa2FXY0dpZUdMb2IxT2VzQ3J3cjlIWU1GVXpld2EyYm5uZndp?=
 =?utf-8?B?TWJudVZZNERGd3plcGVlUFYzWGxIakVwRndiTm5mZVFYNGJrd09JYlFYQkdR?=
 =?utf-8?B?VEptenVsR1FRTlpXeDJZdG9uNVpoRXBwYnA3eElucnFXbmpvRDN3Y2FEdEJX?=
 =?utf-8?B?d0RoNEdxNk9CMnJtbk9yMWliSS9vdHlNL0FLb00xY2htV3ZxMStKK1ZjWWVv?=
 =?utf-8?B?bXh4dUs0MWE0SGtpdUFsL3VoSGtMRE1xNVhDTWhYcFd5V0d1aEQwWTRQWlU2?=
 =?utf-8?B?N2RlUkJDRnVObzVhNmVjV2IwZE9vK0RHbExTd2dZVlNiNGNLR1NDc3liaWx4?=
 =?utf-8?B?clR1RUJzbjMzTlBIRUlkbVVjR0NYVHhzOUhlcHp0d2k1OGhkR2puR1BrQVJt?=
 =?utf-8?B?OGtDMjdDRVBqRDhKL2ZYTGU5cExzL1k3UFQvUXltOW5YZ0ZORTUrRklXMzcy?=
 =?utf-8?B?eG81aDc4MTdCcHdtd3ZhV1dQQVpsVlZIWHhkMmwxdS96b1VoM3AzbFlQQjVl?=
 =?utf-8?B?V2JuYUVLQllRZmU0UWJ0aEdDZTVreFRwTEdWaElRZGdVYTNMampLK1ZBNVYy?=
 =?utf-8?B?QUR3dUVJZmFHM0ZuR1ExYktNVHpyYmNVdmlyWHJRRW03ODBqM2JPaUxNOEJC?=
 =?utf-8?Q?dTVPPbCF32yqjnDNE1kLrnA2oGplGJHKkx3UJcPmfhQvZ?=
X-MS-Exchange-AntiSpam-MessageData-1: Fee//R1J/y0U7A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806b3529-bd7d-4415-ca2b-08dec89392af
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 15:02:08.3450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTSG6RhR+WZ/gvnbUCGoqaHjXeCLXth7oQOV0BoF/vfHhW0+3IJ4pgOSCrvrJPbqy423LmNhUpQwMie4pDhXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050

On Thu Jun 11, 2026 at 2:49 AM JST, Timur Tabi wrote:
<...>
> @@ -387,20 +367,21 @@ const fn make_entry_chipset(self, chipset: gpu::Chi=
pset) -> Self {
>          let name =3D chipset.name();
> =20
>          let this =3D self
> -            .make_entry_file(name, "bootloader")
> -            .make_entry_file(name, "gsp");
> +            .make_entry_file(name, "booter_load.tlv")
> +            .make_entry_file(name, "gsp.tlv")
> +            .make_entry_file(name, "gsp.bin");
> =20
>          // FSP-based chipsets (Hopper, Blackwell and later) boot the GSP=
 via the FMC image loaded by
>          // FSP. Older chipsets use the SEC2 booter instead.
>          let this =3D if chipset.uses_fsp() {
> -            this.make_entry_file(name, "fmc")
> +            this.make_entry_file(name, "fmc.tlv")
>          } else {
> -            this.make_entry_file(name, "booter_load")
> -                .make_entry_file(name, "booter_unload")
> +            this.make_entry_file(name, "booter_load.tlv")

`booter_load.tlv` is already unconditionally added above, won't this add
a duplicate entry?
