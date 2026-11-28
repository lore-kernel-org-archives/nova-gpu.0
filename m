Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795831490;
	b=rSN7hfN+PYNK6W+9AcvI+1Dil1myvyVcqYALQn9YYLhdZ4OaJPoBxQeDEH5zCf6Dkw94
	 2yW0bWh9tAlpz5xXLpO196SkT855x0dklA0ruBZoArzjhp0AQlmKIkNPRAQO1QNpWBgX2
	 k128v2CL1Xd06aCVpZ94mZpfhE5dfP0Pwjp+CbXPxoK9G2kr/D0qGa2Dxn1LlolXX8l/a
	 uYDjNVWjFzh/UVUF+jtLNiAOmDNAd96+LvWrMgSb8wHKBIozRxuR3jL9zgDk2b8DObmG/
	 CD0dj+3N7Hz6m/6Uk1CmU5mGG5Tjf+SeszVNK+NTwtcFhsa/cqF+sl218Mny+iBpgJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831490;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=DBvtikyQIHMFDwWjDYgkPu9ooQ493Xt7VugNFAL3PnY=;
	b=RtJEdYyno13+lqWOKhI9XnTVZ2lZblLjoC1NWf1fppqqL4WtHmV+mHaFpRYaAbdJEuzr
	 Iowbf8qmmkfWu7NTnGe6v6VrxslG2OV1mKQ+ZxJcyb1+On4OBxWyuBChQF71prz/wnvnm
	 Ab33z/jnn8wzw+Z/CSzZA0RuWGxc8xwqveJ41P0FGMHImGKzNftS1Lq65iByUgPOaa0ca
	 Kkvc/o+Vjka02OjSn1XcnkHxDKQmm+iDZsos4p+HYvasv+D6fS7RZkHJS7ZvsR6A58XLs
	 dC+pZQInUBS0sgM1ltyBf/V3K20LjASPBBqC/2k+TXTFoNgUs3VzjuHysioERv+FWTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bxu4dnSV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.15
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2E606A31C
	for <nova-gpu@lists.linux.dev>; Sat, 28 Nov 2026 02:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bxu4dnSV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opqHCbwioewhRGQsTrg8qthz7NzIsdwlkRVYB8FYo3p5SECWScXccm1zdnAvj35vhViUmEtU4oD83og7Es43CjCXWLXHKUJPBmL2GrCv+mcGbSEA7lEHAO6xBhfhdYsJkkFKQUeb3ulUGAlWuXb1NXgoxk+3k++PAijtr8SGIFCUVAA/VH0ihH2WQsnMzJ4GWF/2FTdYPMyqDesFgY+tDG1cpo212jh67Ea0B6MUHyGZKPE7Qj03DKa8QV5jq+QNQWlW78WjersnMx5ucnAM9h6nN1pAePE2eI/HpXQzKftkyMqWmuE+3D8/CyIrL+lpacZ4IiXPjfAwJ9kGmEVyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBvtikyQIHMFDwWjDYgkPu9ooQ493Xt7VugNFAL3PnY=;
 b=Zb5o08kchCJ5dik+2PNZVVC0rWw0CzF+bmEtyapYKSObn1RuKZ3YqZbaa2NgRl/S7elQt6vHDSQ7gB2jNtovcO7yLAdkJiteWRBdZuAuU3tWCBJI+A6fAC62h0Fst9rTQQJnzl2z0vBjb1ek4v16uNdLc1CL9d6pp2a5AZnv+9fWX7fNlug1xsQa2ShsZme0gFmFKErP16Ir0wy/+SHS2YIUSGKRdWHnV7KDe2tROQ0PmNGtfNkfBujc/QaqRna8mx+Ff5op300bNwwip4rHL0dQQTRitksc3YuvD/ehmmIObjjWTZufPn79FsPQ2X0guZIOJYidp90YobIWMTQr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBvtikyQIHMFDwWjDYgkPu9ooQ493Xt7VugNFAL3PnY=;
 b=bxu4dnSVw70psmDuFJf5eQum7DZ1Lsst/xWJg4Q7WYTbo8FK+c27UsqFH3APQWadFtHoCz8iT7tmp8HQ9qNoqLCUqFZiIg9m4p1ATC/s2AKzz80KpJ2ptPBrKXBSNU2ljpWzIuOzMtddccwpFm8d8gHxFpuLv7c1WH21eogIFsfTJ8JTyan4ne7dhS0yPwFE+75wuzzwJ+CwqKkomkFPtLeedImexttBR2cr2thpZ1F1sBaeKXTuPqqtok80MfHyl/uCHhkhIDUwocwYLUy7IVog0jHM9+oGeR20RWCDwULbXUfyyhHWAIzBfijf+SFf6lef+g594w81DybExL7KWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Sat, 28 Nov
 2026 02:04:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0662.001; Sat, 28 Nov 2026
 02:04:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 11:04:42 +0900
Message-Id: <DN6H4Q2ZBZ5E.6QBWI631Z4ZU@nvidia.com>
Cc: <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <lossin@kernel.org>, <gary@garyguo.net>, <ecourtney@nvidia.com>,
 <jhubbard@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] gpu: nova-core: prepare GpuMm for shared access
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20261126213652.3716162-1-dakr@kernel.org>
In-Reply-To: <20261126213652.3716162-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c53fd9-3264-4c42-99e5-08df4cf3f97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10070799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HMMgNSxwDSYkzZ5V0ny96WpG0Icb7M+phFFK+f4a0zty6llOCzmMPTJWvkTsAJhqVeOpkK85CWKk3GJ4dc/x3PISXPHrGKjQFV3x9khj7cNhpdXoQ6gn5MG3oCF9qKJV6mqvHKflsreAAEYZLjKr5cuyWSxaPLpyzz6qz/CiABqOb2tt3ChzMhbiBb3TxL6sJT85bkkU0vChaLNfxFJPGy/DveNko7R43bHHrYuWZ4pT1Tx/e1IV8c1dOLthtArXHhmgU3mgDevKnvFCSoj03abjkVSpVzqxkGZtH4NJsftJ/j+ISw9nj3tcuemmKgwPlVn2YLBxe5RP9+EQy/QxVMHqN/qLCtjkSKyiQEdZu3QiuePRp739YJqlJ1VePES3e/eixCNiZy1Tz/QhTT6qrrjlEEtQH7jLF/0wpzjGkzkgSN0N9roAISazfQDYZlSKQaxXhoUhfl+YXVn8Cia3mo28DmBeoXKqWw12bc5xmyOxRsAkcl+jUwbeed/HGlhuWU7NqLWizj/CI00dUJvaIhx2Lbr/VM7bcFhM1aF5RGPVr2txqcM09CjA+WHbOZWvr6qKBkjpnaMRZDh/jo0rwxgZk28kycMc08NGwKgRpoxr1SvBB9bPs/Cs+q6i3wuKWE8kS89gPycs/lzIWZvtEfxqcuQVj+jT95OiJG4IoFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10070799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzZYT1JXWllya3pJVWc0bGFlTC9FWHR3K3FtckFRYjlwRjdEZHJaREtVamtX?=
 =?utf-8?B?aTJsV1BESVBDK1p3QVRYby8rbUNXQUFjOVFlWHBoRUdSVG9TZGFrckZRZjcr?=
 =?utf-8?B?YWxjZnUyaVZQNUdBMkdiamttUi80emYxVWg1dk1PL09jeWIxdkkzeEUvV0JG?=
 =?utf-8?B?aFFxUTNMVEUvd3lkY2liQ3gwTGFPSE9ZV2g3U0RNOGpJaDJhRDg0TTFvMTlt?=
 =?utf-8?B?bHlQc2ZLdDdLMUVGamdxZ2tjYm9Oa3hpcHJKOXNEMnJ4M0piTGtoQmQ5dHph?=
 =?utf-8?B?SURCT0xRZmdZbks4MUlmQjVMYlR2QkUxTFRnV3RPY1F3ZFRWWENwd0JzTjZl?=
 =?utf-8?B?SE9PVi9BdWJyOHVEUXVLbnlxOUtkMSs4RENGT1FQVU9TS1I3T2d4SGhLRjZM?=
 =?utf-8?B?M0F0ZTZqTkorZS91MFNad3VqQUZ2SXpnU0ZYcEY5OXhkRGErWVV6ZTdUY251?=
 =?utf-8?B?OGZoTTBnMDAzZ2JxNG5LZWM5MytmdUx0VUJ5MC9hb2l2QzBiNm9oelJ0NUpv?=
 =?utf-8?B?aDgwQXJmRmhWRXl3ZGlJKzJhREZsU3dVQWNkSWVqV2IvbmI1YXA2RTNUS3Y3?=
 =?utf-8?B?Njh5bGRxM0s4SWJndHJWV2VVWHJYSVNWUHkrek5Odk1QS0Z3UFAwdzc1ejJR?=
 =?utf-8?B?RFBnNkRhSXNjMENsdzF2aDhQQVB3WWJsdHBJdmdzV1ZEdE5uMStlN1Q1dTF0?=
 =?utf-8?B?Mmx6WVBMNmc1VXpPMnQvUkpTQnVxcUp3UGtWMmRpakxqOW00eWlRb1BwaDgy?=
 =?utf-8?B?c1QzeTVJUm1TMkNFL2s3aHNSUnJ1ckFQbVc4TlkzN1d5S1VwbmsrNG9SR2NW?=
 =?utf-8?B?cUJZZmFiVzE5Qjg4SHVXaUcxWXJzTjdWL0w3ZU1mNGlzNmRncGpISVAvQVRT?=
 =?utf-8?B?MllaZEJlZXFHZ1NMampUUFlKeWN3UXF3ZVBybTFBS2M0N1o2WXVrZVdjcU9r?=
 =?utf-8?B?SmZsaVhVYW4yZ2RsM3lhaEkvOEZTOXoxWXJGbEpSOUZ6Mjh0M3RTczJqamgr?=
 =?utf-8?B?RDJXaUJaS1NPZllpcnBST2E3TUZQSEVndmp0UHZvaDJLZS82N2RGUFJqbnBy?=
 =?utf-8?B?aVIvUEY0cS9KaUxNc0pURXpBZlAwU2RTMzJjbU5EQXRuOXRWenF3WExRTFR0?=
 =?utf-8?B?aWU0cWRybXIzcXhnbExtaXpVQ2F3aUdHUGI2MElxWUg4emEwS1ZnN2ZKTjBu?=
 =?utf-8?B?TzJJZ0tCbFBiT0tWNGl2cVBIaTZRVy8rYm1VUFhkZm9yVFNxL00zMmFvSmtC?=
 =?utf-8?B?SGdFeVRKWWFUQ1ZDNDR6VlBwOWx5aDBBS0w0ZzlMMExxeDI5ZkRoc3lwdzBp?=
 =?utf-8?B?a1VnNmxPdTRObXdxVGJsdHBLTnlISS94OW1uNUx4alNuQkFERE5WV050R1c2?=
 =?utf-8?B?TERtaitLS3luc1FXYW9NMkZxSXZ6SmJaYVNMU0YzSTNBMGRQQk1uNzJYOXFv?=
 =?utf-8?B?WUxsM3pBS3NKUnRUVGM0SUt6N3NDa3YzVFJZSG1NcUVWZlNvbGsvZGlEWEpI?=
 =?utf-8?B?QzZyL3BWWUZaYU5wRzJsbVdYMjVBQ2lYcStEOG15R09SbUV4UEJ6VXRiem5q?=
 =?utf-8?B?YVFSNXdpNmhmSnZzV2kyRUVwMnc3a01PRDBYNDU1WUJZSzh5WTV3NzZOdEFw?=
 =?utf-8?B?cU5SbTFFcjgrblN0YURXT3VMTkNOaEkyRWVDOWNHZWtvRWJ5MHEyMldxRllY?=
 =?utf-8?B?OVNIUU4wNTJmT0FLOVNUNERLeHpZeG1hOXVsSGNqUE5Fc2dGbXo2L21PS1M3?=
 =?utf-8?B?eEFldmJadUN2U0hzZmF3NUlSUnhyS3RZZmgyWEZXVkNVY2o3MmVWTk9MRSs2?=
 =?utf-8?B?ZXRHakk3U2JiMDR5T0duUG5kR2lzSjJ4ZkpaeVdBMEl3eHROY1ZicEVla25G?=
 =?utf-8?B?R3hwdHowNXlQd1FjMXM5c3pUckZjWjBNVHVGQmhNVHNNOGNhemlMNEJ1NHlr?=
 =?utf-8?B?UFhYOVF0b3BaQlQzbUxiZWh6THI1TW1RZFozTCtxN2ZBbWNBZzJZOFRZN2Mw?=
 =?utf-8?B?eitjYU5XMjJNZUc3SFF5WE9xdmR5bmY5MVVvYzdLZWoxWXlrQWwycW9LbUZu?=
 =?utf-8?B?WlBZcFpvZ2Iwdzk5QXA1NDc0QnI2QUpabHYwODVMWCtsemI4VFp6V3V6TUQr?=
 =?utf-8?B?bGVvQzhpSnRJNDgrZnBRVURTQXRFbVJUVWEwZExnZVJhRFQyRDgvZ1BnQTRO?=
 =?utf-8?B?WHRneHF6bm55c09mNk9DSExnTTZtcFlORTNZY2I0cE1HN1FHdkxnWFJ6eFBn?=
 =?utf-8?B?TTlWbXJ5dHhYaXBNSUR3QmJnMThvUFB4bEhwQlptM0pQVUEyTFVZU0xFSEtQ?=
 =?utf-8?B?dEFodnlmRmcyNS96V05qa1VrVDdmckNHV2Riek5WQnZ0QVg5Vy9OR1Y1OU9h?=
 =?utf-8?Q?4hHqyc+7QLTdENZz3YrZtIAMZMZnmmdWc5ED0+VpE9bUV?=
X-MS-Exchange-AntiSpam-MessageData-1: G+r+oOyMeJTiPg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c53fd9-3264-4c42-99e5-08df4cf3f97b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 02:04:45.8043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy0f2EGzaoq8gdv+VTl5BAagtO34U/5Sl5BlXTYH5AZJ3voqn/a43415bZNpGjZrkGtGa9gTKrZZK0KZhaFkyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773

On Fri Nov 27, 2026 at 6:36 AM JST, Danilo Krummrich wrote:
> Give PRAMIN independent locking so GpuMm can be accessed through shared
> references. Initialize GpuMm in place so PRAMIN and TLB can be embedded
> directly, eliminating their separate heap allocations.
>
> Danilo Krummrich (4):
>   gpu: nova-core: mm: serialize PRAMIN access
>   gpu: nova-core: mm: use shared references to GpuMm
>   gpu: nova-core: mm: initialize GpuMm in place
>   gpu: nova-core: mm: remove SharedPramin

Thanks, this is going to improve the vGPU code quite a bit.

The series,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
