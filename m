Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08330F934
	for <nova-gpu@lists.linux.dev>; Fri, 29 May 2026 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037537; cv=fail; b=AbnXDkpiE2ltIWqMiUljj49fny4xaJ0l+IdRjufAOPCvp2LmXHq8r273Ql0Y1p0GIazeZmT3EF//6Yj1nZ7EeFzJTp1WwZDQjOZgfg3M+g28KjRS97vjeQ8fORDUXDXQM7a0ui62K+kymqFXjfLnV+FpA+gxgInNIlxqRbrjKGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037537; c=relaxed/simple;
	bh=upxTHg7stbbOupMJctr2NaxkjJNPhfuPacSsZqRItQs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XjWErgolfrVcoBBnMthBqiLgt9muOBHzvxyaWTg7Q8ILunm/HctWyNf6EN1ZATR7QUyvWx0L0i/NXtmPuXfU21Ie230WalhZ3nX2UAZ7RWaDLW0ZEXXlM86X+VKBko2Hon0eStpr381ZNeJyslLZmcwAg7/MhC3kpTbOpD3/X1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MY7ez3mX; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MY7ez3mX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ3DkP/IwmRx5j9cLC16S1WSm2xf9YghzBc3gnRv/PM3KGinyHusZxgu4dRzf+PDj7cHPuGjxcPTD0CkPe54XhOEcdb08LeZCR7bb2szF0OOv65yC9QSGNLClqs7a4FvixLodmDe8IgBaWbPKLAUwvHrxsVq5gKXGzLtX//uJTD80rp2hpdzmW7dC2umT3yEk++qhp4NKXMqDaMp/Mzx1ZGklJJzgeK+HaK4a6PlyW3qETuGzBTBsFv6qnN0xsmuvwDxR/fh2MmBZrnzgk3LHEIWQmY14q+A1i+eVNJqdxR4lZJ7/Dz+bPhHRDczQAIxFdOROSvU1kKd9IoSepNMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IirjjKecDoPoDGnWAHq/Ub/G8rqeQT3LX1gcqRSB2J4=;
 b=qHTSgqJx+nIGnyJXM2M+AyiqJtbohmT1KfPwdpZWKf4EweiV/GjmpMHP1rcXrnJO2eF75dWd+o6ku2zr4RHV7LLipm8M8sD/LLjpxOsrOzzpf4xf0K8GSCs9eGqNKs8cG6CKvrAYYAadiadPv8WGC7vW/gt2OlFP8tv/L40tA0zEIXa4X3LMYGYcdadpMQy3SXxIn+kkNZSOi9+Re+nWtaRcFe52VDXhKMZs35jePMAxHLDg1MhE4lHsd6fEKgpSKI4+lV5SbK/HBGWRIU3iiCt6gO6Cojf2n9CiCoGVpHAqb1u2siM6H4Vmy0iwVuXRJD8gYuHKUlWjjoQ2GB5mlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IirjjKecDoPoDGnWAHq/Ub/G8rqeQT3LX1gcqRSB2J4=;
 b=MY7ez3mXG2TsIKXaX83cGWJX7VObRC4gX1I72W0f6EqjA3y0iotOPnu08OnSKzd0acRdTynxgxN9riuxWwzArgMKNJS1KOOAV4LRabSE/GTdeAHRj6lgkRdtT1aqC35Z70cwjFpeHP8DSDet4+pcunmbz9lGHtIrytA0K5ToGXfSI4zkX0UAHyaHpWicOhJ9xDCpnOrRU7of1XckzBGIaQSN4fPGro3tS4piDjznYz1mJHxatdOmj6g5vwDBZoyLn8O/kkOS1cTZAE0b/Ym0IYB2SwsbN/m5zYHYbMKTU96jsrV5H9mHUu1HH29fkhY84WoWD2G8K9CHhQ/KUNb9Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8532.namprd12.prod.outlook.com (2603:10b6:610:191::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:52:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 06:52:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 15:52:06 +0900
Message-Id: <DIUYN2VWSJD1.1K0FJRRZHM0PK@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH v6 0/7] gpu: nova-core: run unload sequence upon
 unbinding
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
References: <20260521-nova-unload-v6-0-65f581c812c9@nvidia.com>
In-Reply-To: <20260521-nova-unload-v6-0-65f581c812c9@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: da99603d-30de-47c8-af54-08debd4ece6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|18002099003|3023799007|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	EAQsFb5BUH9nniHS/RmAdEORlt8ixiQuziO7GcvtXdq3QWESMrUURm0oitguJmw6CMfBb6kOdNfrgVw6w0rN9ZXUKWNbcwlAxy/cZBHaI425M/EYnHDwybx1nRBjaYGWPBAPTa1Jsmb0Fhp561BDDhPImfItT3Hesm1W9RZ76e725E5Ph+KGHyfDAwn6d6kpV3RhqE2nc9j2NYhu89tjIb15icIAgBP0wKIfWZ0oyLsEjEARsbV/72JgDoPLWFpvxgbXDM8MMhgb2tQFCnWZdjHW8fWmXt1at1Ru6ex/QxTiVKc/QUmvAjd4it9j7e1P1vD+BST4FpW8JhExA3msZ34AWnm5f9PrBbLXvYGJy6J9rWu4xj529XcoIIIA53iv8XLUmO7sE7mf0yvieLYeaAgWiaSKpOR155+9eZqMmUizIBsx1g4pYE9YJXlFQMd9Elrompv8xDO0rGk7jtpoalXAFF1kI+agmPCFWnDOx01QZrbm5vQ5ix0FYSIKq1uRyTqnHHGslDg39GXig5/TabsXTgkhcKJ8n8DOUYeKqZ7dbg+SuaRFnamGOU9sVW1itMr9cDELFSPeC0rUH6WfMXtv7rSdizD6hJvpacmGfJt4qUwidWk99JkpuooJGH7x+NrFo1tw8ONiyGTOWPAEmVk99LVDdf6zq+M5hHMwoDP1j4InRGK8fLWynuV4ie3IUTSTRYyVEpnxKpy+f++Ctg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(18002099003)(3023799007)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFF0RTlQV3ljdWhsT04zOTUvb1JtcDRvV1ZwSDlqL0poY2VqaUw0UEFIMkVp?=
 =?utf-8?B?U1Q2TXV3VTd3Yy9Mb1FRbHRQVUEybGw5ZDZSaFJDR01TcjRkUjFYdHFmdjB0?=
 =?utf-8?B?bVZIMFlLMHk1SWZPWkN6Qy95K0tNOUViWk9wSGdKekhueDNqakNxbmdLZ3JS?=
 =?utf-8?B?VHBaVWlKZmhBdFJ5b0tnejljWi9VU2IwWWtPM1lIWmxPL1doOW04MnE0allv?=
 =?utf-8?B?eng2TzhNMEErODlKNk5PaGxXRUJrcFlnYzNrNWxkMU9sbW1wc0R1aWZqQjdH?=
 =?utf-8?B?VTJVM3FUeGNBa0RqYW5VYm5VcWhvMlRKRzBSVjYrd1A5UHRJTDN0QnRlZnBI?=
 =?utf-8?B?WHJOSXp4VW9qMkovS1ZuWTJMZFBYN2pXcjFyZVQ5TGVMWEFXNGNDQjNQcmJ2?=
 =?utf-8?B?Qm1mTmhTc3d2dFdxYzRRdDh0OENSNmdQZ0N0Z2l1dVIvYWYrMkhjUmFCWkh4?=
 =?utf-8?B?b0s4aXpNQVRvWW1vc1o1Wmw3R3dJblNmYkNaR1UxS0RVM2gxck1WSC9FT1l3?=
 =?utf-8?B?RHI0YitEVkNLVm1YdXR3YWJnYnVRMGNkTERtNlRpQm5SRHRtMGRhNUd2UzVT?=
 =?utf-8?B?cGlGQVI1N0JTWXFLaEVmdElZS2RKZTg2NXRNdkVzc1ZLQjV3Ymh4aHRIL1Bm?=
 =?utf-8?B?dEIvcW9kUHQ0WmNIWnVuM0lmQ05aYzBJcFE3NUlHYXlzcjVnV1ZtN0x1OHkz?=
 =?utf-8?B?c1Q3czA3VUlIU2Q5Rm1iWlk5Rk1DenhncU9sZWxqejdJbkNQMEwrUFJlRWNx?=
 =?utf-8?B?K3h4eHFQNFpKOTMwT2JmV21RSExlRW9pbTdQV01LRkRiUlB2K1FvOTRCUTZE?=
 =?utf-8?B?SnNvVmdyWFk4TTNvK1dsV2tUSy9tOVdOOENTOG45REFuZHorTk04cE8vcmpO?=
 =?utf-8?B?RGtMbkRhZWxocWZ4ZVg3TUk2ZU5lZlV3MENnOVJ3V2ZmcGxLaUxLOFI0YUFn?=
 =?utf-8?B?dy8xWTE2dnVnMGtTa0pFQThnT1N0V2ZMQUFKVW9oRFRCT2h3S1lmb1pMSFQ3?=
 =?utf-8?B?a3RqU3J0WDJJb3luN1l3b2RBRlFJMGs2WFlMTHBrT0NBZzFSK1RGY0VwOFFF?=
 =?utf-8?B?eHdiSmwxOTJsRWFSZkQxSWpld1AyUjJRay9yNFZ0dkZNWCtuVVVSd3BYTnhM?=
 =?utf-8?B?VXVsWmNxeEJpeTZSYXpOVkdHWFhQeTF6d0FQT2d0MG9NeGxUVllKbXRUVHRr?=
 =?utf-8?B?RWV6eXJkNzd2c01PNHRqaGpLNWZadklCME1JdUE2MmoxZmhNOWtJTDhyR29h?=
 =?utf-8?B?Y2JEQVdnRUFVclE1dm1oQ3JrUTY3OHJ3QzB6ZjdEVDB4bzB5Q0k4Y1RhRWVa?=
 =?utf-8?B?SWJwL2s0N1FjVW52b1QvdElWSGlEdVZ2d3NIWFpwajc5RHEwMVdsL1NHQzdS?=
 =?utf-8?B?VWlENDd5dnpDU0xhUVU5eUdYeVhRL0xrYVJMaERIUThkN2kwYXNTRXA5Qko0?=
 =?utf-8?B?K2YzR3R5cVUzSUpQaitBK21oWmF3R0cxa0xSODlWVWpHdGxKWXlPdTRWRERy?=
 =?utf-8?B?SmIvR2szOXhGNzhzZ1BqMlh4UEVzbmdpaDdXUmp1VEZpeDJkZWVpUmF6UlBn?=
 =?utf-8?B?bVhvVUlYa1k3UE9tSFpDcm5GMTZYMzdnUDNKNUpOL2Qvc0ZQVkgraEMycGVw?=
 =?utf-8?B?QUNYNEduRzY5ajJLVWJXWWlEUElaUHJXTnZ5L0ZUNnA3NEMreHhHRnRuUjd3?=
 =?utf-8?B?QjlEeFhERmFmaExjY09FV3RLem1Geno5OHBkS1pKZTdJUjcwYjVBeVorQ2Z4?=
 =?utf-8?B?Y3Y1ZkxOaUNEL3luS3h1Vk82azRpbko0TEZhazJjemxDcHFob1BiZDhGWTd1?=
 =?utf-8?B?TUVGQU5nODBuelZoS3ozb3VTRHVSM2xKMTZyVEpPR0VOMkhtL0E1WWFLV1Bl?=
 =?utf-8?B?ZlJRRXQ2b2Y0bEZzZGczRjZJdkxzaHl2cUU4amVVMjFlUC9vRWozaGRhSU1E?=
 =?utf-8?B?TWhSeDl1a1lscFAyRjhVVXl2SlUzM2V4Sy9md0RRNTFrZElCVXVvaitERE83?=
 =?utf-8?B?cThBL3ZXSGhMQ2FkSi9NTjFyZlJ6MVRQdG4rZVBMdkVoTVFDcFVPMVFteTJs?=
 =?utf-8?B?dWVWNTlmOG9YY05qMXdLOEVXWCt4aWtzZ2U4VUt6RkQrRGN6dk9yL1JKMk1B?=
 =?utf-8?B?QmpxNGFoUnY3b0dXT0pCV29CcG5ET1UvREFxUUpScmZDalc0QlF6UG1DamxP?=
 =?utf-8?B?cXdYS1lXaUVKTXVydlhCZHBRbDZOOEJXamRjeWNsNTBDeDZqaktPc1RDbnFM?=
 =?utf-8?B?bnZyMFdpOUJmek1KbmwwTVhndDZSNkhXYk9kbmVIbktpVmphK2djRUNQenV4?=
 =?utf-8?B?bEE2Ym1yT3kyRHRCQW9aZ1NNK2FIY1NJNmE0bi9DYWVNNi9QTHJoSEhGZ1N0?=
 =?utf-8?Q?M6if2hbs3uS8ROl/ZH5tFH/OPB4Bk6Zj+cu0eETVxBOPT?=
X-MS-Exchange-AntiSpam-MessageData-1: /P0QqOSmQl9vJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da99603d-30de-47c8-af54-08debd4ece6c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:52:11.5472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mqeNSyYdjtQk2YJ2ltOyXu2weV/ozlwqvdVbYJ8Jf0LUPp6ypITgxmweCMTFTAvklYhUzoWPIeUnJFixhpp+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8532

These pre-requisite patches:

>       gpu: nova-core: remove unneeded get_gsp_info proxy function
>       gpu: nova-core: do not import firmware commands into GSP command mo=
dule
>       gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::r=
un()
>       gpu: nova-core: gsp: shuffle boot code a bit to keep chipset-specif=
ic parts close

Pushed to `drm-rust-next`, thanks!

I will make a quick respin for the remaining patches, with the intent of
merging v7 quickly if no new issue is raised.
