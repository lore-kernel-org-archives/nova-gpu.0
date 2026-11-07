Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044928;
	b=H9yVLsMBeR8R8IeTKZOcAFMWYB/3wKYhVpwHm8HDyaSNmr1NmEJsA2AHDQtWLkE2F2NG
	 bGk5Nnm39mRfwynzp/OLGsWUM77E1eZiFDfxYGTv951JTRKQ+ZyllGbCRd9/6Gyd/n0YW
	 cSohyIDiK+X/ZmKQ4sLexk6d0ywbT8+tbsCjNHMNcs1G3cQZcDg9DcVg6JA4ktq5kfYjC
	 irTskm6f37tKbwkIB8EmgiWQlogM7o1MxINVwnv+PQCrG39dCeWo/ltspSsIPt+Yk8VQ8
	 yuX4F+jHhys0Dqrh5ZdvOQ07BxJeaz/D2W9KBjSmLGYg9vA8fUDEL0t846jwn4BzA/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044928;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=HWX9RfAlmpjCDKsg5I0XC5Bxf4XwOnaSID/mAIPla7k=;
	b=1L7Hp0Og6FTgI2uiK+cOB4gQbeBXzHWrhGd7SFTMF3CuqgUlv1f1RsZHwgAA1sYvgBXP
	 BwTjNYd0Q2FHUgv2I7eI00ynsN+E8eI8vDxClEoYrjnfpb92iUNIfFc6utFttP2gvwpPP
	 y94Dz9TIgQ59U9AcFP25GqexZuQrd9JzLj+6fme0wmhifqqSdFwnan7hMYQnF+z934cbF
	 tIqnOvyoQ0rk50lt8KGYUC9BvX1lTdJsZXzuyNQGQlN7VtOs/7t+fh2aNSBMAhwIFnVT9
	 KFeENIBu9EMafo6Xsgk8kO0CS0dxpwf8x1iNN1yz0096UR+mUDcNSqcHP12XuiKGc0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Vn/6UGYD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AE9606A33B
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01AE9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vn/6UGYD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwbcKIDGhlRFT48z1fGsJbamh22HnXEDRDQ2w2XQs0I4gLY8VlKs+LRdQKAi4mG+Am570OMUbNHDCX5dBHaAu2yRYFNz7S7+0a6X8v1ajuyBbsFrvUBIq2PA5p+N6804cSOjNrdKOyc6b2jD/PryW00+XRAxX6pbznDDhqYKvb6cHfbRYrVSYHjHST6Xb/S67AfGwiW+kmtKRIHZReadF/c61QmKq5vEsMMoexRMwrm6UgwF1TfmxA3r1dvqv8RigOHItrOve7u9/fd0EI5rJZ0dRJ3k1xTnyvM6Eb0xRsYkf8Lr+MmT6jBuZZpH1+EtemflGrrMjn1V6t0MQiCNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWX9RfAlmpjCDKsg5I0XC5Bxf4XwOnaSID/mAIPla7k=;
 b=nL0zvahCfZJ0RruT4BSDDzjIvuaC3FfYvMn2JbIGW5xZacG/BVSBsgJ+Tk+5KeI/K3h5/phnWoDM5wJyV7U869VEnWbjuWeMFx+8kzrQgFhF4Kf/ZyKxdgmutYb683701TkN50GT/suXhyGgzLEdc16qPs2x7lTiZvkOHLmCt5oUDPHhidDwUpyB0bV/NsMnmLB/p4KHXQeE4dQwC0eWVLVu8ujtMy9KKOW0RlUiTkMZ0LdpmUb2Q/WnQxP4lNoa+j7n5nngy9fLnssow+mDdrXy2weNzuNWx5rW74t0WwVX+GO7c1EpOsc6nM4tcdyNK9uIHNasNBDSsUVcKMjfqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWX9RfAlmpjCDKsg5I0XC5Bxf4XwOnaSID/mAIPla7k=;
 b=Vn/6UGYDJQ/SrMvfdo4R999dzPrme446AGMsGRlsoOKcbMmBtbK//I/pwSqip3RUjaY37sTgc0DDYTKPKPwCxMjkmOnUyQAIrv8UcdUd9Cgt/lg8UePRvosxQSz2JGLap/rppuP3LnVYL7TNa6jYLT9J9ErIwtajw8MV5z42TrLfE5+sUUQKfzhpUlvG3eo5ypaZs5afWnmEYH6nMgUGDWMLPUEqwtphiPpOfMb7VfT0wJYx8sRe9F+6PsbdGchIo2eisQ8PY7Nfgr+duoQSnyY/TjNBhr3iJZADo9avo7AHZN7T2dEYW8UpckXB+VF6bnfkOrTYnTaK2UDa9MTWtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:35 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:01 +0900
Subject: [PATCH v2 05/12] gpu: nova-core: run the generic bootloader from
 its own type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-5-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6PR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4d476a-48df-4846-4eb3-08df3cb44a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|3023799007|261022105027099003|11063799006|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	f/7wwcVhEpqSNIb2TEIatK5/NqdXtyIcUxpnBIZRy6qr9Tary1lg9/CRitx78mh7/UdTd43hyo4g4igfNsqXeWD39h+LOkNV9QpP4eEIuwLCNb193gGJHpvyoKA2yC1qYYIVmJ/On1AxxyfGAWi4VKz4OpvVIIa7QVifWBA9hGc1ibXrTcMflqoML7TUo1VL3ggTCzSyuw3/81PnKIVprJdFtPHx0IHW7CwU/RWdyCSskL0Z5n8vaVQgcZT52dSDDoN69OdNshmN39CpePyeNWAiCOHvKUW/O7i6PJ2XXjFK1JhqKvpDK1qB4a1uubVtv9dfZJekr/4FPacK3qlvDj1pKx0kcUX6VKxLzOCr6QFNTRljJFG3RXRbuf7/FaFXqxl+cs8gZ/YHfhpXFfpO8s8fpY0+qps28cEDOLfezReXic8JZYM0g22te8WtXn4zIDPMP2/8jKBgvfjZDpy7j+IqyCy6cBC9P7gyABEcRf4judB8wO+kt+Pr/fSskBbpkacjllZGXMi999+rzc2Z5+5TVKMsXAZWDv9qZDWqIJeihjKvaoUjxLWFZBXN8ljP6fm41hOeovxTSV2o2TYJJCsg/c+hbfAWMk2CN0udYbCtZP1ulF6gYbSdhtazD+MfLmiwzyMb1OvkHD0nG/T/BpjkapuDJ3/i22WblgTfeNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(3023799007)(261022105027099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0FLYjh6SHJ0ejlJWEs0QlpHUWlBYisySVhNMDd0NCs1eHRPMnd6R2RYNE9K?=
 =?utf-8?B?Z010dkZ5Rkk0NjBTV0F3Wm9nOGlJSGtPS1Q0b2J2dVNINDZNYlg0eEJ5VDR5?=
 =?utf-8?B?L0pENG0rZ1FDK0RjSzVkM0t5M2VNVFhqRHYvVXNZNWVRUkFMYkpEajdURVJv?=
 =?utf-8?B?VlBhV21vVzkreWlrNjZJd0dmWDVCNldkUEt1MVVFd3hkQ3ptaTF4RzB0YVE1?=
 =?utf-8?B?dUFRVTVVQi9aMy9YcytHdHZSYkxWZXRCT1BuaDIxTFRzbUpBSWczQ0ZDejhX?=
 =?utf-8?B?ZnIrTi9WL2FURHZOODRpMExJSG5Bcy9YSWpCeVNBUjMrZTg5TmVDaERFYlRB?=
 =?utf-8?B?TFA4VGdmaEYxNFcwenJScXZrQmlmSkl5QXdBZmJqeEJPUVhVYUdVYWxrQ2Q0?=
 =?utf-8?B?ZkFMbkUwUW1DZ3ptakZ4VDNaa0g4NGpqbVJHSzlxSEhmbUdGVWltd05aS2xS?=
 =?utf-8?B?N1VtenVMMlUySkppKzFaWFhUYVM5MU5PcS83bmdPNmN5RXF4Q3dGcFRHcjZ4?=
 =?utf-8?B?ZHg3T21SRzF2SThxaFovaE8ya3ZleFFMczd2NGVFdS9sd2RscmxTVFptd2c2?=
 =?utf-8?B?azNoUGlUalh1TUpIMFhoSGg0Y2toM2Q4bFFmQmt4SmVKOEJOZ2ZmU0RuYXNM?=
 =?utf-8?B?OFpWamRlYTFGbnplR283b2djOHo3c0VoUFJ3Sml0R1YxTE1ldjlJbnJXSERV?=
 =?utf-8?B?REpxYnlncDdISGt4VTBZLzlWeWtoRW4yaGNVMmllTFAxWHNBQ05BVWx0WFNE?=
 =?utf-8?B?RzliZENZaVdaYlhBblowZDlwb2h0NXlSUXZqaDZEVkF4MFdqUC9Ib2ZaTnUz?=
 =?utf-8?B?LzhRanZpRUhWdSswOTFDT3Z0TUF5NHJ2UGVtc3VER2wxZS9UaHYvV0lMbzEw?=
 =?utf-8?B?TkVKUXBjU0VXRUZlWXhzeVJJcExNRkRBNWJCTy9XbkRobGRmWDNSb1V3SE9a?=
 =?utf-8?B?TURDeG1YQzdiS2lLK1JLQU1wUWc1QXM5RE92Qm1SQ2M0djVmZnFLOEVjRnd6?=
 =?utf-8?B?QzNSL0xudjFKbEJBbVZtc09qa2VqOTVBa0pxNnFMUWg0TXFKQVFXNFZFcFdJ?=
 =?utf-8?B?Rzg0NzVBRkVuNEtTQVU5c3dKREVPSzhHZWtDOEtnMTJHZGF2YWdrazJFRnlT?=
 =?utf-8?B?QU4rbG9FTDFNSVFpMTNJck1NN1hWN0hkeWRiQzVJcEJKU2RVRzMwT2RkVUw3?=
 =?utf-8?B?T0tVeTlhWmczTDVEUlV4eEk0WWN3Rm1WaHRuRTEvY0ZQTklkVEVoRWFEOURo?=
 =?utf-8?B?Rzl0ZmcydmlKZmxNcmY3Z3d6MHV4ZEdLQjdVc2ZTZHIrOTdlMWUyMllkOGd4?=
 =?utf-8?B?SWFhNEFHODFSbEhOVUxqL2tJRTNNeEpTS2lwbS9nRlhySnlPQzgzdlpud1Bv?=
 =?utf-8?B?OHVlbWI5UG9SdUEwRnRKYm1DMnV1T3R3azAwU2hFenhNOWdQNGl4NjdnNlM3?=
 =?utf-8?B?bkNuSW4wTnFmMmpmYkxVUGl3MitIaHo5QXVtWkZiZCs0a2lINHdHV3U1YVNL?=
 =?utf-8?B?OFp5bVlQVDJXV2IvRkFVK2dpcFRQb254b2FUTWVDaU5wMmZQRXhGbkdmdmxZ?=
 =?utf-8?B?QzNjbTNweGdzaXZuK1VDK2xZWUptZ0liN1RDSWhXWGhuUW5JNGN0YlVCbDlF?=
 =?utf-8?B?ZUE0eVJiK2xBdHdlWkpHYTNSZkxuY2R1SVJoSktHaGJzTytIK2YwbzhqMTJF?=
 =?utf-8?B?T0NLM244UXdNTWlJYXhSVkoxcnVqU2hhTHpBQjRRMWljMUJaek9OSGN3anhL?=
 =?utf-8?B?VmNsMVpYb2kxWERPMmZZRFFwcjM3TjZJUTNuRnptTzhwUDdGRUYwSUtPUnJD?=
 =?utf-8?B?cU1JemxmS3lIT0hLaVBuZWxVL0R4bEsxeTlLNmd5WjZEclROSlZwdGhQR0hR?=
 =?utf-8?B?UnVOUjdtMHlxZWtUbFFXRERidVI5bVYxNXp6am53S0FEeVNYM01YMjlsSEFD?=
 =?utf-8?B?bFVnZy9zZmdYTHBjeEVQWjBTSjNPTmhiSVBhTFAyeCtUYkFFUUNnQkNCdi95?=
 =?utf-8?B?SzN5VDBMbVROcjFUb1VTak1aZ3BNOUhsN2NSMUNsb1hQUllpd2xPaHcwVWFw?=
 =?utf-8?B?ZmRPRXoyQnd6Z05tMVZPWDVRYjg0Q05tLzhMamIycHNRT3pOM3ZyNjY2TGJm?=
 =?utf-8?B?N3lhK1hOaUNFWndtK2hSazRQVzgvZWFzTTV6aFkrYTBxZUptS3pTMTVnb2ht?=
 =?utf-8?B?OFBrdU85SVpFSG56RHNZMTBaK2RBMDRYQjFPTGg0QkhSRUlhS2tVT3M3Vlhv?=
 =?utf-8?B?Ly9OSEVVekd6STVMYXdHc0swM1h3MXZ5Z0ZBdHBZV0YyY1hZeFJqSmErbmNB?=
 =?utf-8?B?a21nME1aa0U4RTF4dmkwY2IwWXhmU21HUmx2bVEzQUlFdVVEeWlaYkg1V0F2?=
 =?utf-8?Q?P/K/AjcSnqRZyrqBjLyFBijJekR4YMGo4BkG5kXeAL3B+?=
X-MS-Exchange-AntiSpam-MessageData-1: Vtjs8cGa49DeuA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4d476a-48df-4846-4eb3-08df3cb44a9c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:35.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jCpTVmGGN/WnmmFvxUyq/MfqrGCMVl3NqbRa1w8a/EFIxujcXM63kT3cbSID9JZE1pHr48nrWwrh/4oeUvi+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader needs a descriptor in DMEM to know what to
load, so loading it into a falcon means loading the two together by PIO
and starting the falcon. The FWSEC wrapper did that through its own
implementation of the PIO loading traits. The r000 load-and-execute
bootloader event will need to do the same thing.

Give the generic bootloader a run method, which pairs it with the
descriptor that it receives, loads the pair by PIO, starts the falcon
with the given MAILBOX0 value and returns the mailboxes once the falcon
has halted. This will allow the FWSEC and r000 load-and-execute
bootloader event to share the same code.

No functional changes.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  70 ++-------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 100 ++++++++++++++++++++-
 2 files changed, 102 insertions(+), 68 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 19e047f1c1ed..90b875945766 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,26 +12,15 @@
         Device, //
     },
     dma::Coherent,
-    io::{
-        register::Array,
-        Io, //
-    },
-    prelude::*,
-    transmute::AsBytes,
+    prelude::*, //
 };
 
 use crate::{
     falcon::{
         gsp::Gsp,
         Falcon,
-        FalconBromParams,
         FalconDmaLoadable,
-        FalconFbifMemType,
-        FalconFbifTarget,
-        FalconFirmware,
-        FalconPioDmemLoadTarget,
-        FalconPioImemLoadTarget,
-        FalconPioLoadable, //
+        FalconFbifTarget, //
     },
     firmware::{
         fwsec::FwsecFirmware,
@@ -42,7 +31,6 @@
     },
     gpu::Chipset,
     num::FromSafeCast, //
-    regs,
 };
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
@@ -54,8 +42,6 @@ pub(crate) struct FwsecFirmwareWithBl<'a> {
     bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// BROM parameters of the loaded firmware.
-    brom_params: FalconBromParams,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
@@ -128,7 +114,6 @@ pub(crate) fn new(
             _firmware_dma: firmware_dma,
             bootloader,
             dmem_desc,
-            brom_params: firmware.brom_params(),
         })
     }
 
@@ -137,26 +122,14 @@ pub(crate) fn new(
     /// The bootloader will load the FWSEC firmware and then execute it. This function returns
     /// after FWSEC has reached completion.
     pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>) -> Result<()> {
-        // Reset falcon, load the firmware, and run it.
         falcon
             .reset()
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
-        falcon
-            .pio_load(self)
-            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
-        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma()))
-                .ok_or(EINVAL)?,
-            |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            },
-        );
-
-        let (mbox0, _) = falcon
-            .boot(Some(0), None)
+        // Run the bootloader, which loads the FWSEC firmware and runs it.
+        let (mbox0, _) = self
+            .bootloader
+            .run(falcon, &self.dmem_desc, FalconFbifTarget::CoherentSysmem, 0)
             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
         if mbox0 != 0 {
             dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
@@ -166,34 +139,3 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
         }
     }
 }
-
-impl FalconFirmware for FwsecFirmwareWithBl<'_> {
-    type Target = Gsp;
-
-    fn brom_params(&self) -> FalconBromParams {
-        self.brom_params.clone()
-    }
-
-    fn boot_addr(&self) -> u32 {
-        // On V2 platforms, the boot address is extracted from the generic bootloader, because the
-        // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        self.bootloader.boot_addr()
-    }
-}
-
-impl FalconPioLoadable for FwsecFirmwareWithBl<'_> {
-    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        None
-    }
-
-    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(self.bootloader.imem_load_params())
-    }
-
-    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
-        FalconPioDmemLoadTarget {
-            data: self.dmem_desc.as_bytes(),
-            dst_start: 0,
-        }
-    }
-}
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index f769b2b277c0..1fecb6a5f80e 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -7,6 +7,10 @@
 
 use kernel::{
     device,
+    io::{
+        register::Array,
+        Io, //
+    },
     num::{
         Bounded,
         TryIntoBounded, //
@@ -21,15 +25,22 @@
         self,
         gsp::Gsp,
         Falcon,
+        FalconBromParams,
         FalconDmaLoadTarget,
-        FalconPioImemLoadTarget, //
+        FalconFbifMemType,
+        FalconFbifTarget,
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
     },
     firmware::tlv::{
         request_tlv, //
         Tlv,
     },
     gpu::Chipset,
-    num::FromSafeCast, //
+    num::FromSafeCast,
+    regs, //
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
@@ -184,12 +195,12 @@ pub(crate) fn new(
 
     /// Returns the address at which the falcon starts executing the bootloader: the IMEM virtual
     /// address of its first code block.
-    pub(crate) fn boot_addr(&self) -> u32 {
+    fn boot_addr(&self) -> u32 {
         u32::from(self.start_tag) << 8
     }
 
     /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
-    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+    fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
         FalconPioImemLoadTarget {
             data: self.ucode.as_ref(),
             dst_start: self.imem_dst_start,
@@ -197,4 +208,85 @@ pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
             start_tag: self.start_tag,
         }
     }
+
+    /// Runs the bootloader on `falcon` to load and start the image that `dmem_desc` names.
+    ///
+    /// The bootloader and the descriptor are loaded by PIO, the bootloader is started with `mbox0`
+    /// in `MAILBOX0`, and this returns the mailbox values once the falcon has halted, that is,
+    /// once the loaded image has run to completion.
+    ///
+    /// The caller is expected to reset `falcon` beforehand.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the falcon has not halted within two seconds of starting.
+    /// - `EINVAL` if `dmem_desc`'s DMA context isn't valid.
+    ///
+    /// Errors from the PIO load are propagated as-is.
+    pub(crate) fn run(
+        &self,
+        falcon: &Falcon<'_, Gsp>,
+        dmem_desc: &BootloaderDmemDescV2,
+        target: FalconFbifTarget,
+        mbox0: u32,
+    ) -> Result<(u32, u32)> {
+        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
+        falcon.pfalcon.update(
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(dmem_desc.ctx_dma()))
+                .ok_or(EINVAL)?,
+            |v| {
+                v.with_target(target)
+                    .with_mem_type(FalconFbifMemType::Physical)
+            },
+        );
+
+        falcon.pio_load(&GenericBootloaderLoad {
+            bootloader: self,
+            dmem_desc,
+        })?;
+
+        falcon.boot(Some(mbox0), None)
+    }
+}
+
+/// The generic bootloader together with the descriptor that it reads from DMEM offset 0, as one
+/// firmware that [`Falcon::pio_load`] accepts.
+struct GenericBootloaderLoad<'a> {
+    bootloader: &'a GenericBootloader,
+    dmem_desc: &'a BootloaderDmemDescV2,
+}
+
+impl FalconFirmware for GenericBootloaderLoad<'_> {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        // The bootloader is unsigned, and the falcon HALs of the chipsets that load it this way
+        // write no BROM registers, so these values never reach hardware.
+        FalconBromParams {
+            pkc_data_offset: 0,
+            engine_id_mask: 0,
+            ucode_id: 0,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.bootloader.boot_addr()
+    }
+}
+
+impl FalconPioLoadable for GenericBootloaderLoad<'_> {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.bootloader.imem_load_params())
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
 }

-- 
2.56.0

