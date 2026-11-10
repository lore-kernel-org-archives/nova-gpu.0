Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306106;
	b=dyqDIkqw0gZjuIh9EOZWd06QG/graIwPNqIyxz+MfmOBrBeI58MSdB6ykK/U0aZ8YeBB
	 mpE7aR96zyporg8zfLzMXdEq7YlpNzQ4o98nGRNIqid5DHEkfm2hF3EgzjNnQTR/Frqba
	 wGTWOpTmsaH62teMnrvlfzZvrkYbyWMpePLse6cSRmeuP9HhJCahM3y+UNJ7FB4Wslx/s
	 h5BhFEIh7qkjdQQ+g1Q+fVd7S9Ay9iqPCdZi/StuwVaBm4mCEnszies4U6ug+QJs7+7rA
	 AdqJaXQoyXkxU+W1RWxlsJT3X2QBltQBvu8G99D+R95CHvLm9Ye3wuy0pzVLZmeR2aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306106;
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
	bh=I6rkTGQ6ru4EyWjzyQJxRqf4ToIpNVTNIQTAvl29k8w=;
	b=NkUgRq6L4grK93W5Yqa7dI5xv8PlCMVfrxDayqjokKc6G7TYj55b+xoDcgLsYz7P+NLa
	 NT43DsyTe/4DtMNXZwGKGp70/mxF2i8S/qpLzCfJ3Qt+s0cMijS2e121j2QinZGmB4lSB
	 8cRFxIe1juGWxfJdGENxITF+FbMN5w7EJ559r/YfOoFczWHeqBcaA8Tk7uhXHTgNgkIG6
	 KUuon8KOnySTuEvzDg/IPeDFFM13+OXihYPc/hgxwW0U/6FOFHIl/EEaQg0x1bcSFIi5S
	 fYbs6y5FE4F8lfPTdHHIPPEvilv+4tXgxAq5tcrP1ZjXaB/ferp7NC45G6fI2WesDpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kdAlOnxk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.29
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6E606CD56
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C6E606CD56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kdAlOnxk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqxiIYflsTrVd5YG390Gm22xA2RhUxNNMVnRRIqp4la3gV+dGQtXQ9Wy2rd/rkzfyFv0VHjsxu7nbgPw8SCL7TBj8QSmV34aZXKbLLErU/QVrpxXQRNa4PwhqLohY7oxvpMDYB+KiSxCuIk2CmB+J9tUVIA6zsGCrUy8i0StMN6VHtxebVXOCXYDbjcXGcMGBn8bcFOKcjwR+ElSk/BfLGLmffASIrMYraRvI+9hCU3cwDPOT1/QAQHuTALx8hTn/y+zI2j4ESGHV7eIyohU60SoK+hWwF4zFcLDgJdBwj/aN4uCh4+7MHLBDqqNYE37x+ECFNM6c3l/AEf7MEjdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6rkTGQ6ru4EyWjzyQJxRqf4ToIpNVTNIQTAvl29k8w=;
 b=LkK9ooRoomgxYrURuH6AYql0Il5Yn156dgp0oxAVU/7bMqCkoZiWV1GNpb48uvTO5nbfruoNjgjVKKyHGfH50Js0kpCdkb6hpMrpeJsMsUsHy8K8X1/T+TrjormM1CYiUma37TeDAePECatAqqngSSiS69XxNS0+lFs1AhZEbPZpLXhkp/Oz+CXjEcuIAVruv472hSs6bcz5iqeFQezMEM9tmK3G/rm76OkzwapIE+Zl54sHR50IDxED0GCyDEBSprOInU34iK+izEd/IwfuVpD0oCfavUj1zkSAu1+OndVCQZRKxIa38RfPb8Pyg4RdspoWDFltrCUjOENebVzJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6rkTGQ6ru4EyWjzyQJxRqf4ToIpNVTNIQTAvl29k8w=;
 b=kdAlOnxkJJd/RzIgfd2aE4xKT2I/OKAcXeTshY8pwXodhqE9A9dCzDksOSxhVcIODdl9JdhoP5BNMbOQPaNlikncxfEHFRQ/XRYyx5d9YfB3JMKQNqhLIu2m9xDoBnQDwLZIRPNEvsodIbI4S2ErWgChEmU8mbow+Rj4Lv7f7+K/RwV0Gg2ICGKGlB4DTC8/xiV0dTMDjXkQDlzB73fEb6BBASTXNjGbL0gnAkVzQIYSvrPoc4A/X7zimlNxBBEByNVrKXDhIvB8uZ+IIxtgKfkRAf5uW88+xYvjH7us7tfSXf3LsgQUkZCS6xRuM4YeRKsVSro+xK+Osf5nD4Rjfw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA3PR12MB111810.namprd12.prod.outlook.com (2603:10b6:208:712::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:43 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:21:01 +0900
Subject: [PATCH v3 12/13] gpu: nova-core: falcon: check the per-block DMA
 offsets for overflow
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-12-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0201.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::15) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA3PR12MB111810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0b1626-3319-4ed0-8ffc-08df3f146a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|56012099006|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261026121527099003|10067099003|261028144727099003|261102123227099003|261009223027099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8DmoIBxrodsxC3I8r13UXjlcv1elmvWyZ2uA4ly3C4CPFF6Ei1HUTYjyuzh/1j6F29OHC2yQ9ylYR6Aiaif5E5yPLXiHURHMqAujPOhrWf4MD7pps6HB66UVMFYiUCRJ8lHNoFxAYmfVbfpMy4lgzHu1u91LX3EC7zaacyQaYXC8gcRtnQyTTn21s+lLCeUh3mgmpBPgrYZ26PgSTyMgSwaS3fW6TtNedI7NE5e6cX0iYG2nPhh25HbXR9/79xJlpUMLTCTCRwgV0W9BQ9M/DWEb/yns1/G2b0LBPnNqeoLSHR8StYTcc9bdE4yAFrpBR1kZdFb2Fv0LTRJ5/6kjZNSU6Tgf9rhLtM49l72k56D6TbJ8yyqbWkl5/ciAYX53GXdI4x4Ia/dmRrnugyIGmrEbnufa7Sl8Y9j59MEXoXrz659qwH88ITt2C+qNrjn3IL+Fsjt3afevlslU+1T0tlKBv9uIs369kjp+jKpAmcSlzM0WK051/mFAxHaHkwpdcwcp87LSYY3LYMXd4IaTO9CqJj1lLjkL+offA8YPZli0nBNLZVRTz8DhuFh0I2Ne0U3mVsgrMZnHcEYw4PbkCt/E7EZXV18XsNY3bQTHXrNHyaauBd1gCAGjomBjuvH8st2Z1TLx3KprXLUjmaV7Jsme2Z58GflswEHPJTAgZbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261026121527099003)(10067099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVQzYnExa0E2eTZPWS9IOXhJZkc0eUpBTDdKNmdDdHZXYkxaUU9EeDVHanRn?=
 =?utf-8?B?bEhPcUkzYmZ6WmhHd1prVkNnc3RZc21ZcmdhVUZITmxVQVE3Zm1aSHlCTHRy?=
 =?utf-8?B?b1NIWUdkcEcyanZEL0k0a0JVKzdJS2xvb0lQb2d2NDBTL2c5VzlESDQrR1M2?=
 =?utf-8?B?bS9UcTJCcHdvcG9HTnlUL3FHRHRDSWhIMzFhWEs0bmVZWlp4TWlvUm5nNlA2?=
 =?utf-8?B?RW8xM3llU3JKdWlFSW5OQ0JnV09GVFF3Q3FKRXNKL2kwTUpseW02R00vR1VX?=
 =?utf-8?B?Qm94TDFTNDdSZklUbEpJZHJtancwRGVIcWNCeWo4a3VYK3VKekN3ZXNwWXg5?=
 =?utf-8?B?eHQzNjZmcFhwcENIR0NjejIxNzhqUnk2cDNhUk0ya3RzTkhBelJvTkJRNG5x?=
 =?utf-8?B?OGQ0Q2pObndMRFc5MnZTNGl3S0QyTnpzSEt2ckJNNGZtZ0VCdmQ1SnpyeFJ1?=
 =?utf-8?B?NEE2YS82c1c2Ui9RMXdIMWNiSjV2U3BjYnQ4b215QkVrdU9EczFxTUdhMU5O?=
 =?utf-8?B?QkE5a2VMZnIvOVNZeTRBa0thcXRPNThmM2xNSmlTTzlnVFFHWGZYODVDRmwv?=
 =?utf-8?B?YXhYb0hnVGYvTFRac3VuN2g2TDFBVVJWMzhzZkR5RnlZVmZtQ1QvbUIxaTg1?=
 =?utf-8?B?ZUlhY0xlL1FwV1F6Y3ZncmtKNWpXZmdXVmYvWFltcFFrT0N3OGtlVmxCdjBW?=
 =?utf-8?B?dzVxN3liTXk0aHdWajlFcFFEcUM2b2gyM1NqK3JxZVV4S0tXV0pvK1I4aThG?=
 =?utf-8?B?QUw5WmxhM1FrZHhlR01XdFMrelI3ejBvZ0Z5RjB2bDBoUHdkODA3M3EwR3o5?=
 =?utf-8?B?U3oyczA0T3I0WUdaaXBscEJXUDJRUnNTeTE2RVhKLzY0WU5KTzVad3RCTFRO?=
 =?utf-8?B?WHpZYkZBbHdoQlFXWDBzNTNMakdtOWlMTDZBUklVcjhkSEd2VjZBZTJBTE0x?=
 =?utf-8?B?cEFkak5wVksrbHA4NC9BcDZST3Z1TWkrVHdOci91MldZN2xpOHZXOUtBTEls?=
 =?utf-8?B?WG11Unh6R2dIV09qbWV1QWhSWjdLc1JndHZ6K3FJUUROMEFRa0M2WmcvUEpU?=
 =?utf-8?B?Z0VXQmxaTVU0a1R3bGpjeXZIYzhES2Jockw1akFmclErVXBBNDVDN2lROUg3?=
 =?utf-8?B?TWNjcm9lT0JKa05vV1cvSXpjY0gyclc2QjZMYksycHA4UXQ1OHBvbnNnWWRK?=
 =?utf-8?B?WW9HQ05WcmlWa1BCcFg3UVJaKzVKYnhzUWVVWGVIZ0tzSkswbDE1eC9qN0lX?=
 =?utf-8?B?MnZJRC9nRVdwczI4SVVMT2doQ25seWhpeDAyOU5JdTloMlc5eE83c1p2NmpT?=
 =?utf-8?B?U0tOb0tWcUFtUlk4dUtLNnB6bGlLTzB1eGIwS1BHaVZaNGUyL0Zoc0ZrbUM0?=
 =?utf-8?B?UnN1REE0NzYzSG1KdThXaG9WWUFhMFRjN3l3VTI5MDZ6cTJ5TXZid0lBS1R0?=
 =?utf-8?B?eXFHUWMyZHVNMi9GN1h4ZitXZS9pUEVXQkF6YkJidUIxc1F2SXFhTytBR0xD?=
 =?utf-8?B?Z1NCOU5teERvaXJUdWhGRDhZUXFKZzcwUFVsaWRHNkNBdjBkNSt5M3p3R0F5?=
 =?utf-8?B?RC9McU1SNDFCT2MzeGxLY0pDVXRHNWFheW9meFV0a0E3dGNrbVY0MVIxUHk1?=
 =?utf-8?B?ZXZ2WEJJSnozTUZYWER1UDlVWnlCdUQxRS9ROTlXeWhHNHQ3R2cyQ3dzZEpX?=
 =?utf-8?B?SjVvWVZxdmZiUWRIaUNUOVdmZkxwRXVaS3RTTDZnUmdTbXA5c1RpNWNXR1FI?=
 =?utf-8?B?YVhwdHExMFh2WlRNYnpsc1M1V2VVem5KZGxNelI5RzJXcTIyZkZocHJaUDlz?=
 =?utf-8?B?VUdMVmRqOG1PRjRLVStzSGVjTHNFR2d0V3pWZ3FsSzNmd0RQUy81WlZkZHBu?=
 =?utf-8?B?ZFNkbjZ5Qy9wM0tyZnNMMUVzWUZLeFc1OGZwZGpKM2FGMVROSkNTT0YvTG5q?=
 =?utf-8?B?NHhDVkRVQ2NxdEgzSEV0aktxb3lhbTYwSUxOckd1OE5xWll0ODhTRVdsOGpP?=
 =?utf-8?B?TzVDY0tYb1pFSzFlT2gwTEJSeEZSUE9wK3AyQWJLWHJ0V2VEaGtRYlVmSnd6?=
 =?utf-8?B?VUFVQ1ZDTVBYbFVhNTZWdGZMUnRpVGFQVDFmK2h0aDMvU1dKM1FUSnFwMWRs?=
 =?utf-8?B?M2NOb1R3V0JleWE5dHQ5NnBudHIva09RQmVvNk9KT2FzVDJPcXFYUGEwVjMx?=
 =?utf-8?B?K3BTY2EwWUhWVVFSVmI0UkNEZmp0ZUlRbTBDV2JLcHVnR2d1NVhYcndvM0tm?=
 =?utf-8?B?eXVtbExMRzltY3lZa0RZTFA2UkpsZFRZQTVOUk9GNnZ6VmtLQksrc2hYVUE1?=
 =?utf-8?B?MWJXT3dZR3ZMSFcxaEhIMkt3ZFhZcFdUY0FtQXdFY0dmNG04dklHYi9TYlo4?=
 =?utf-8?Q?h0pinRhjzWwTaEx0iASMFO7THHMJD4Cy1G+hBWPTaxsaZ?=
X-MS-Exchange-AntiSpam-MessageData-1: LpUC45nsDza4Sg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0b1626-3319-4ed0-8ffc-08df3f146a99
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:43.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4742JZrJ8XghmwY/QfaHw8NdUIpW/id845+WSy4q2WeO/cPmhgzXzA+b4Et84d8sqzGCX9bqBShj5ZBISdmag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB111810

From: John Hubbard <jhubbard@nvidia.com>

Each block of a falcon DMA transfer is addressed by the start offset of
the transfer plus the block's position. The two additions were plain, so
a source or destination offset near the top of the 32-bit range would
have wrapped or panicked rather than failing the transfer.

Add the two with checked arithmetic and fail the transfer with EOVERFLOW
when a sum does not fit.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
[acourbot: split out of the DMA helper patch of v3.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a7e41e282ec2..beac0b7ac57e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -609,12 +609,12 @@ fn dma_wr(
             // Perform a transfer of size `DMA_LEN`.
             self.pfalcon.write_reg(
                 regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
-                    .try_with_offs(load_offsets.dst_start + pos)?,
+                    .try_with_offs(load_offsets.dst_start.checked_add(pos).ok_or(EOVERFLOW)?)?,
             );
             // The source offset doubles as the virtual address tag for IMEM and tagged DMEM.
             self.pfalcon.write_reg(
                 regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
-                    .with_offs(load_offsets.src_start + pos),
+                    .with_offs(load_offsets.src_start.checked_add(pos).ok_or(EOVERFLOW)?),
             );
 
             self.pfalcon.write_reg(cmd);

-- 
2.56.0

