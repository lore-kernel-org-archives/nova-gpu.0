Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346222;
	b=bF01kM4y+1Rf3sSxMPZSquOMuYaXNLORjffkJddQWdZanicuO2L63FBptc8hfESirl/7
	 G07Ap/mxFDbSyBYmbk/rJ9J4mKaD1Q8Uf/euNJ2PEtjONRVO79/xvWZcw4/SfSTXzT519
	 VUEOyufRAXFkjjINx9rwJBN33AO52N2jtv9WytPacC500oAyEJnYwiKKFA0F8um/zkRkC
	 BpeVGGYlhUrt1QLmN27WavLF6ZeC1BiWtr7XmEl5h/jyuFhIID00bK6Vzk2rnhN0rhk5I
	 PZThNyJvtjpRymIjcbg3IICLSjL9LX3u90BQXfV4Qb68zjoSKaQmTJI5MTzndTZFjjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346222;
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
	bh=YEKfF+VCex6/1UchrzatIGZrV2wtFy+wZ00X2pWroow=;
	b=SyAWnxOe8PvwQXhM3WU5NfDkg2NUyXGyfxEaRcoKuKkumWhJPuHFrGztJtNlbFVAmsT5
	 bKp6f1FfTkJqvwxaja96IQFJPomoIm7NymCQCXIT/+z1+icP0D4czgMRRN1UPNZhZOXGn
	 UFtJq6ZV0+W7/SC9QfgdVaPiobCNsAtqhL//3mCL481zXBvtS6qoBSFI7hC++arwQtUho
	 vHtgkcvAttRsBRs09rmZN07E1hd85rf4XwZX+AxSa/1sKOHEuNNRe4Zu5ovxVdPVyWRg1
	 zvEAFnN+CROKP90iVJX9TmzFAMJD1goGaUmDPybQboUob9s+K9dpnHguLelpxfTGqHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TSo7F8eV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.50
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D87606A33F
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 07:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D87606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TSo7F8eV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxSocfucBfeBNSkWyoL6AlmVMrXDOnTNC70ehhvCqMwHSlY23DMTfZu3tOqeXnGn2OV/qdEOUIEKhJoZo2n/vsKU3XrrrodgYLRaH6y+JG0Ke1vSaExxf+DjmmUFpNaf7eqWU/zT4UiAGKnYwcrBAiHfwBThlaCkc2apnfppduLIwmv6sR0jcQBIL9ZJ/DNEUiVQh2IFnBYwNDwTGB7Gt/afzUZh/4gRIAMpC4LubGwevsu1jBjScRBX4Zd+/uhU079zjyKWwbdoqjM4l9yacFNFC/ykTuVIbp0EpfA9Z0oazcV6bqVMfh8m9ehE8yl4X3CTL82AGzRR2uofMYLM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEKfF+VCex6/1UchrzatIGZrV2wtFy+wZ00X2pWroow=;
 b=wH66nFmAew6JKORv3Q6mQ4FetMWFnGY6tYAzGiuF4VA/P2vioCmkC2eKe37Jgaxr9vNEPRJR+cKM7tY0jlY/vlyXlQXRdx9oerKat0adVF01NtSi00nPHRU3oKc+k/wlPmA2ghIeP40zZV38HLFku1iVJJr3swKs97MyTngShLwz/ScUK/vLF43+O+NnSHG8a6sZFRGknrCVy1wkQz6YBYJWrO4XBkKwZOOmdiPQgSgMEt7XQIqYAIiY6muPvhsBIyb+pfkUSg0OhxcYlxSPvWvujxK9YiVMLNEtbKEG3ZOr4bCbYI3Fvn6iWSfkdyenaIgGX9wS4WVrHQDT8AsaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEKfF+VCex6/1UchrzatIGZrV2wtFy+wZ00X2pWroow=;
 b=TSo7F8eVqSHEnoJGCSyWBSnr1TxaUO1EDvunzUvSu2vDp3aGTxOtY8jCbN4uizgS2aEvZ3j2oq39fLifEm71aQzZUtX16kqTB4TYYt3dMrAjUY6uL8vu1Yq1C7IGS9G1nRFpcR62SFvqWSI/LWcUPPsZ7msf6GIiCK2FwPGRjNybFD1g77RTSDyxv1Q8l8MDfc44Es1Irm2AuyDKyng7jSa2JLjgHEZ2ctMX4sU2btnfum2XXMut9CixyA25VkSBsR5sPjyIfecS24sP0STrGEgcxQEySRuBWSOS3Z2MqwTS7Y4Qm3yj/94nKfVU3HGYNBFy3/3QXNL+ateP302lmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 07:43:37 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:43:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 30 Oct 2026 16:41:34 +0900
Subject: [PATCH 3/4] gpu: nova-core: gsp: cmdq: ring the GSP doorbell from
 the queue memory
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-r000-cmdq-prep-v1-3-f2befbcd8ba9@nvidia.com>
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS3P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21e::13) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2a20fc-3af3-4132-748d-08df365981fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|3023799007|261026121527099003|261026140227099003|261022105027099003|261022115727099003|261028144727099003|261021135927099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MFIh1fknod1LBlyco4V87KQDQgl7SsuHZzkWkTsWA3E4LUqXb02F+1IX9Tu6CbvYtBxHjnuoay2piZ2amqNysmS3GEVrlU6/G8w1PwLEcZuG1CrPYG2DrcFLr4XjGD4jXMRzutKiZdxO+fQQed7RHiBvy8zP/cSoY5Y+rLTMSBMQHnWtkM6bb8te28dOcegqDuqM+lXjTKwwb3yFO4x/5D1nlsOcKVRb9/eif4Y8eApnaCEHXGvUWQl/y8m6MSB8eEWL6J+IcnpIqER7g3yd8SS9dsl7VwmgJjBVfHbkqxCO3UswiSt2Zd+M1acgEXklhd8fXxBdhzOTp/Y56ApAKjDhtjLCSQA1x/OSItNTAZKpIY+hGC7+lZZdJMwkRu7pKDFzVYDawNZ8Fob6eGyPoABPy5e8hrKWLNwpkhUsHxQN9lvRdKhVhQtIkkvM34MrNls4fL3M3o8biwNiJr6qAMD/z2cvvAvHKptD1YqBOk2gNBWZQmmurivHOiuqORMfMA1W/cpVgukU/UteRtjXKOHbu2rn+6+fMPTGdpqU+WgMd1hOqjDGwgLUSRJHZYpos+xWkaO2Df1ZEUiauDOqDTFLsqATxH1O1OkBys6qgOTBPwRd/tsxnm/mYEkhwkdy6SJ9yLVw11LwUmu3yZ1oqhvbSwRZj+NanadZUbttNco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(261026121527099003)(261026140227099003)(261022105027099003)(261022115727099003)(261028144727099003)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkVsYTI3WGVjaUV4U3ZXTVZ1WGJSSnd1aEpZOVkzZnpDWnFKblRLTy94bkNP?=
 =?utf-8?B?dk1RWWtuZDViY3N2dy9VZ2p1QWtUMHJyQzBrVDRveDMyZjNGanN2YUdFajlu?=
 =?utf-8?B?Umw0WTVuL3BybngxM3hUNVRCa0RuUzhpUFg5WGVKdEl0WFhNdVpLUWZ1Zkh3?=
 =?utf-8?B?d2JvQWRVQ3d2QjIva2Z2R0dEd201WTZnMDhCdldNUlJ6MzNMcTN0TXczWlB2?=
 =?utf-8?B?d21pMUkralFiMkV5TTBOV3EveEtCYUVCTDdMbGEzeXdNNUJESE5wNW8xUDdu?=
 =?utf-8?B?Z0UzZjFpS0lOcnAzUXZGU0IrN2hlWDNqeHVaYlFmRkt5aEhWNW9jcTFsZGNQ?=
 =?utf-8?B?NTB4N3c0TmVYV0RvWWtqL0htbjNPK0doNDJsOUNQeUlKeUUyUjlTdnl6dTlZ?=
 =?utf-8?B?eWM0RlZpQ1NPR3Jjb1U4OUxXOWV6ZzQ5QzhkMUxHR0t2YmlTMWZSL1VTWlFW?=
 =?utf-8?B?cGF0UURXcFQ5WjBFbFNDcU9VYVNSMkp1bGIzWXJ2bU0xLzlDS3REL0dUcnpL?=
 =?utf-8?B?Y2xKWnplNXJjREdUSWVvM2RuamdpYmxqY0dualN3M045bGZkN1lVcWdJWU9k?=
 =?utf-8?B?RGM3c21BclZqRG44QTFUZkRQQzZLRFBYeTJCWWRKWkx2WmE2QmpSWEJjbGF4?=
 =?utf-8?B?eUJvTk5KRVlaQVkyY0ZyWW1uTkEwbk9CcGx6WW5scTRFL0pJSXJ2cjZOK1dv?=
 =?utf-8?B?VVJhYWZUVGRZcHNlWkNKcUNLNnpvWkkwYnp4SFpPVGlHaVUyak54d1o3dGFp?=
 =?utf-8?B?N1hoK21ZRGVVU1AyM24xNlRoMlBYYlIyZFRuY01pNXRLQUZtRnA0eXRZd1RM?=
 =?utf-8?B?RStDMlpLZVZJRVdqaW1SdE9MYnkycDRlR3UyN0w3QnJKQUlWemhkZ0dFa2Fl?=
 =?utf-8?B?Q1dVV3J2RGlVL3lvd2hDR3JNNWIvQVFxQUtyYlpKMktmVVZWL0FoWnl3Y1By?=
 =?utf-8?B?TmhFamIxTmcxQ3RKUi8yREJXWmxadWhhcXkwdFFidFRaR2VlSGg5QjJkZFRT?=
 =?utf-8?B?K1ZZajdRb0dlZ0xYRFVxeG1zeHlhcXd6WVFoWEcwRGVBc05ZU2ZOVSs1Tkl5?=
 =?utf-8?B?UkFqZzRaSDJrYUJoSU5RVVhaTWdpMG5lZlg3OHhZd3g0M01URGVqQmI5ZEQ1?=
 =?utf-8?B?RFdtTDV4RWxDV2dqU1hCcHV2cDBiMytobTVRMHF4czZ2MWFpUDQ2TWwrbDZI?=
 =?utf-8?B?TE5Pa3ZHYU52VUpsRjlRakY1ZHZTU2w3YXpERE9vOVlkTmFnbVM1bTZZVXU3?=
 =?utf-8?B?alNtQ21NYUk1QmZ4cmRDeWlJS0Y0cFZmU0tsNnJlNGtoN1dCN1BBMm5BdzEy?=
 =?utf-8?B?YzFjZ2xydnJzQ1pHUHVaVHRiM0JhSERjMW5rR29IVnZEdTB0NzJxN1Jza0hZ?=
 =?utf-8?B?RStOVTJtN1A5U0M5OUxJZzdQZkFEVUcrT2ZxK0xUL1BDY1pzTjB1MXVTaFly?=
 =?utf-8?B?Ym9jc0Ntbm1kTk8xaHNYTVZHMzBHVGdWY1FUUlBCQXRhRThMMU5CQVFndWhw?=
 =?utf-8?B?bW9mMUQvZnc3SWw5WVVHM1RQa1NWZExDUGsxVXNxWFRiRy92cDVxUmZrd1pG?=
 =?utf-8?B?dVRhRUZ3dWp5NzIrSzNzVS9wR2x1aWZEd3dZM3RVR3ZQbjZxdXdsVEE0Z01S?=
 =?utf-8?B?MTV6U1F6TElIdm9rMDkreE9YOWIyS1RUOS9zZXZHWmpyU0I1eVQrdTRybzdJ?=
 =?utf-8?B?em1uRHh6eUxpcHNPaFhIamJ1VjZlSG84SWdnYVZMaWo2NTlOcDZxWXh6RTRF?=
 =?utf-8?B?Mkc3QWhEN2k2emtteTFocVVFQ0lQRUlrNk5UZW9PcmdnR2JxN2xlRHhkczRL?=
 =?utf-8?B?dkg5YjhsWHRmUGFvVFViSHNvblRTU0I3TllaT2twUWV2bGdObjB0SkNObmNC?=
 =?utf-8?B?RzJxY042M0NpTEJDaXp0ckNSYmh0bDBiUVJXSGR4d3BhZGJicXZ2M1dtRHk1?=
 =?utf-8?B?Vm5aTTdCMU1jbldBWWZlUVcwcVFmYkl5NVlUWXJ3bzZTOEpicFkrMWVOcUZm?=
 =?utf-8?B?blNUMm1Md25DWVQ0cUI5UC9kckEra1R3ZTNDQUF1czVvNWpVQy9oUUNtSllO?=
 =?utf-8?B?ek5Nd3d2alZiQVpzRXVlYXBuejZGTDllUFZwaDh1NXI1OENyMjJBNGUwUnJR?=
 =?utf-8?B?NzNSYUFMZjRyUDZLMGNHR1lmOHc0Wlk4dmwxWm9LK2xhSWRmVTJvTVBYYTRD?=
 =?utf-8?B?MUJGd2JDZFhSaDFobzJZcDl4bmhrdG8yUWorRDRFS2RWQWE0c3kwL2xvREov?=
 =?utf-8?B?anVaazZOTFRzdjJXSG5BdUxtYXFmb2ZOUGNUTVV0YkxJbVgrRjFGbkJVVEE0?=
 =?utf-8?B?dE9mUWplSVA3bHVDa0V4d3kwNGNtQWZoT28yZUcxVVVCZzZRQ2xjV1NTZDNL?=
 =?utf-8?Q?NoPmTnj47IOTedDgu5j0ntqHcRPGY3OB866X/adMdvDI2?=
X-MS-Exchange-AntiSpam-MessageData-1: eaqg4L6y/RaZWA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2a20fc-3af3-4132-748d-08df365981fa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:43:37.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bV69xZe0hHIX3ih+Z66qjxhTv76Ci9MsBzotcv1Amnt/eMG/+n8DyI9Qgnci6jUjJjswRRvb6zfGbSnT5M7mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

From: John Hubbard <jhubbard@nvidia.com>

A command reaches GSP-RM in two steps. The driver advances the command
queue's write pointer, which publishes the command, and then writes
NV_PGSP_QUEUE_HEAD, which interrupts the GSP so that it reads the queue.
In msgq v0, the write pointer is in the queue's shared-memory header, so
the two steps are two writes. In msgq v2, the write pointer is
NV_PGSP_QUEUE_HEAD itself, so one register write does both.

Nova-core split the two steps across two types. The queue memory type
advanced the write pointer in shared memory, and the command queue type
then rang the doorbell through a BAR0 mapping that it held for that one
purpose.

Move the BAR0 mapping into the queue memory type, and ring the doorbell
at the end of the operation that advances the write pointer in order to
prepare for the switch to msgq v2.

No functional change intended.

[ acourbot: slightly reword and trim commit message. ]

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 52 +++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index d51797a0a782..a271114fb54c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -157,11 +157,16 @@ unsafe impl FromBytes for GspMem {}
 ///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
 /// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
 ///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
-struct DmaGspMem<'a>(Coherent<'a, GspMem>);
+struct DmaGspMem<'a> {
+    /// The queues, mapped for the GSP.
+    mem: Coherent<'a, GspMem>,
+    /// MMIO mapping of PCI BAR0, for the doorbell register.
+    bar: Bar0<'a>,
+}
 
 impl<'a> DmaGspMem<'a> {
     /// Allocate a new instance and map it for `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+    fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
         const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
 
@@ -172,7 +177,7 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let gsp_mem: Coherent<'_, _> = gsp_mem.into();
         PteArray::init(io_project!(gsp_mem, .ptes), gsp_mem.dma_address())?;
 
-        Ok(Self(gsp_mem))
+        Ok(Self { mem: gsp_mem, bar })
     }
 
     /// Returns the region of the CPU message queue that the driver is currently allowed to write
@@ -185,7 +190,7 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let rx = self.gsp_read_ptr();
 
         // Pointer to the first entry of the CPU message queue.
-        let data = ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
+        let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
 
         let (tail_end, wrap_end) = if rx == 0 {
             // The write area is non-wrapping, and stops at the second-to-last entry of the command
@@ -247,7 +252,7 @@ fn driver_write_area_size(&self) -> usize {
         let rx = self.cpu_read_ptr();
 
         // Pointer to the first entry of the GSP message queue.
-        let data = ptr::project!(self.0.as_ptr(), .gspq.msgq.data[build: 0]);
+        let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
 
         let (tail_end, wrap_end) = if rx <= tx {
             // Read area is non-wrapping and stops right before `tx`.
@@ -331,7 +336,7 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        let ptr = MsgqTxHeader::write_ptr(io_project!(self.0, .gspq.tx)) % MSGQ_NUM_PAGES;
+        let ptr = MsgqTxHeader::write_ptr(io_project!(self.mem, .gspq.tx)) % MSGQ_NUM_PAGES;
 
         // ORDERING: LOAD->LOAD ordering needed to order `gsp_write_ptr` read before data read.
         dma_mb(Read);
@@ -345,7 +350,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        let ptr = MsgqRxHeader::read_ptr(io_project!(self.0, .gspq.rx)) % MSGQ_NUM_PAGES;
+        let ptr = MsgqRxHeader::read_ptr(io_project!(self.mem, .gspq.rx)) % MSGQ_NUM_PAGES;
 
         // ORDERING: LOAD->STORE ordering needed to order `gsp_read_ptr` read before data write.
         dma_mb(Full);
@@ -359,7 +364,7 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        MsgqRxHeader::read_ptr(io_project!(self.0, .cpuq.rx)) % MSGQ_NUM_PAGES
+        MsgqRxHeader::read_ptr(io_project!(self.mem, .cpuq.rx)) % MSGQ_NUM_PAGES
     }
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
@@ -367,7 +372,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
         // ORDERING: LOAD->STORE ordering needed to order `cpu_read_ptr` write after data read.
         dma_mb(Full);
 
-        let rx = io_project!(self.0, .cpuq.rx);
+        let rx = io_project!(self.mem, .cpuq.rx);
         let rptr = MsgqRxHeader::read_ptr(rx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         MsgqRxHeader::set_read_ptr(rx, rptr)
     }
@@ -378,17 +383,24 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        MsgqTxHeader::write_ptr(io_project!(self.0, .cpuq.tx)) % MSGQ_NUM_PAGES
+        MsgqTxHeader::write_ptr(io_project!(self.mem, .cpuq.tx)) % MSGQ_NUM_PAGES
     }
 
-    // Informs the GSP that it can process `elem_count` new pages from the command queue.
+    // Publishes `elem_count` more pages of the command queue to the GSP and rings the doorbell.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
         // ORDERING: STORE->STORE ordering needed to order `cpu_write_ptr` write after data write.
         dma_mb(Write);
 
-        let tx = io_project!(self.0, .cpuq.tx);
+        let tx = io_project!(self.mem, .cpuq.tx);
         let wptr = MsgqTxHeader::write_ptr(tx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
         MsgqTxHeader::set_write_ptr(tx, wptr);
+
+        // A write to the head register interrupts the GSP. The pointer itself is in the
+        // shared-memory header, so the value written does not matter.
+        self.bar.write(
+            Array::at(0),
+            regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32),
+        );
     }
 }
 
@@ -468,13 +480,12 @@ pub(crate) fn new(
         bar: Bar0<'cmdq>,
     ) -> impl PinInit<Self, Error> + 'cmdq {
         pin_init_scope(move || {
-            let gsp_mem = DmaGspMem::new(dev)?;
+            let gsp_mem = DmaGspMem::new(dev, bar)?;
 
             Ok(try_pin_init!(Self {
-                dma_addr: gsp_mem.0.dma_address(),
+                dma_addr: gsp_mem.mem.dma_address(),
                 inner <- new_mutex!(CmdqInner {
                     dev,
-                    bar,
                     gsp_mem,
                     seq: 0,
                 }),
@@ -495,14 +506,6 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
         ((sum64 >> 32) as u32) ^ (sum64 as u32)
     }
 
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: Bar0<'_>) {
-        bar.write(
-            Array::at(0),
-            regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32),
-        );
-    }
-
     /// Logs and consumes every message the GSP has already posted, and returns without waiting for
     /// more.
     ///
@@ -522,8 +525,6 @@ pub(crate) fn drain(&self) -> Result {
 struct CmdqInner<'a> {
     /// Device this command queue belongs to.
     dev: &'a device::Device,
-    /// MMIO mapping of PCI BAR0, for writing the GSP doorbell.
-    bar: Bar0<'a>,
     /// Current command sequence number.
     seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
@@ -571,7 +572,6 @@ fn send_command_element<E: CommandElement>(&mut self, command: E) -> Result {
         let elem_count = dst.header.element_count();
         self.seq += 1;
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
-        Cmdq::notify_gsp(self.bar);
 
         Ok(())
     }

-- 
2.56.0

