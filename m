Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF233409E0F
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098295; cv=fail; b=jMnAVek7BoU5U24l+c+M1skylUHV8qdxz4KmpJHtyetUPjhmE87E0ZnYUAE9rLqOCkjyKoj/oZSX4w2TnHjr2jO2jRn2Pb1zuqCaX/oRq+IykFjtrhaaNkQCt021J+2bwWOFcTRw61EZhltqSx3QzipXukXkI/ZPMEvOFnCm1LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098295; c=relaxed/simple;
	bh=UlvJhNsKJIEM8AsEvVi7edEiueAsWa1jQ5GVIWxM5tA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=KALNJE6SkHGVc1f9TNTSk0zVxAd12myf9pgZ68ZcgzvdCSoDzaA3cPL7ogdMMWWfVcPwecbG5Ooh/j6C1fV5fA2CGQ6/jaszYRL9LObL4V/dYEsYNS1FZUJMMgwIbc9DtPAQZFZL4o/nXwqi3BCwZwpczD4elo/e/ppbdxJEJOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TyiAoMv9; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TyiAoMv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWt9XEpjdjmeeR1P8hOFMHKWwFIgqEom70kX3AxYsT/e+vn1xhRf7D8Kj0DQtZvuVh9ghSjtOXCjbqADGByU0NCU2DqumJ+O+xVsg9vlZ1UHpJx64xzl/CK6e1n5qo8zUpnGNmH1ucneXLWQGy9QbC4mqL90PZfJO+j3MRFXCiRutijvIy2ATFaGcsAa1zL3GxJ6WM7Aelz4w2yChCGz1M603YoqFEntDYWTPQ1whh8pnsJECnqS/1CAqeHQDl4ULfXnaNRh3z/4vtbk0iIFY0CDMFfi1jnJV8RMDo9CeyDz5j6JaRXY0cj3URgIZzqlJFv16BY9KMIQmu1RSZq9Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlvJhNsKJIEM8AsEvVi7edEiueAsWa1jQ5GVIWxM5tA=;
 b=wk71Fjgxdt3bGJ0mJgSqOWT3DLFxLquUtn1SKWACm3RM+3BhyZx2mP4bAZoiLC19s/92SPaYP8rfzOFbIatL5vtwEYYCZ/3kExfIWNCPbdCr3Q1lu8uCCvJJkNg2dLUclGWIOtiLqjOZFhaEcEx85y34aLvczB64BdHEqyigPBl7WrB1X9CDyPEhoY8TQX7cPOYCJ44B5WBwCnMtOGN1xX87hTpUweFkcNWE5QQxjxzIO3U5KeWtodPfGQl4sRzre2oQxL2CfoEpjd3iGX2b0/K3Gko6t244Dr3E1ee7cLwLOdjRK+sm+pOd/YGlF2Aj5OngdlmqWg9cXT/a2HqG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlvJhNsKJIEM8AsEvVi7edEiueAsWa1jQ5GVIWxM5tA=;
 b=TyiAoMv9i1EpyetfMCxftWAmyqNrHkULCc2MQHV2qvPoFxITKkfK8ED1I3QBhjcnCZqSnhegNFztxZy2hwRlTZClQ+squn9n/iQ5iUiGZW3ng+YuKGflSbYGF5+sbRvNiIOi1FeF/nZb87t02UGstixpA2YAuc27AcMxz35ms8ie3EaHq6E21c23Vey2DKmqYGR+QYJZF1itdpMucVkLzut4oZxNZA3LIGVYNPT7CehdLPgDqCwxkQ52TRxPC9rTEtP9XgjYzXJEjYXU5VowLnubLyZot0PJ6t6ngfU6Y6PmX8aNMpeXUNalqjbqKS1DVg/4j7zFJSuQGGi9v1YKOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 13:31:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 13:31:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 22:31:19 +0900
Message-Id: <DJ5EN9YOZOVF.RZ2WJGSB0L6G@nvidia.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition
 into gsp module
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Antonin Malzieu Ridolfi" <dev@nanonej.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
References: <20260607140949.152575-1-dev@nanonej.com>
In-Reply-To: <20260607140949.152575-1-dev@nanonej.com>
X-ClientProxiedBy: OS7PR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:604:253::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 28eeb5ff-d133-4aac-5738-08dec6f49129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	O++uOX7C8N4MHpPtKQDnHsUhHgJHkRyajEYndN7+j5WDI5MS+3AP0vkf/EEP2GeGn30jPgFN5AzcQVSkGDjAqXJ75rC6smGlKDOyWYqM9hhXjLc70QdEK2Lirsevaej6Rs+Yp2JXNABlRJ/KWXAPl3I9b1t2xIm+EEGO7rjGSBHmEaLCyqgXkqOk1lBPfhnYx5/jVhdIz166XRbsAnx+TZZQzw4S3xOpccUjg3PmxMI+b+gpA8O/kqJZ0uQhYAK6Bu6OTPXA1fFr9P+p7wWGYWQEzsoy/8HKzBFnv24pweL9LHkvuCjeJo3u77ZWqDCNZNA7G7GeTdQDzjbRWbJWf5gH2vJ8MqGVjIN8O/oYjksbHQcSGqhiIzk6619yLBi+K5Xhm7kKgO4J2V0SthHIR0L8604MOCACiyzqd9klW8JUS/4AsOiRrcDqklAEaQ1W4D+p95hUDoL7jZi9p1RILSQK4lmyZBNZa4fDhqNzK9IiX+zWNjwtoOi72/t/fXemsEbR9tZEKhTCLUASHrLq8OVr6aJZ7Gmp4LR6gX2BhyOVm94Q6lwsPEgEIX41tVQdSmwUhCbitWQXE9foZbBySGbj4TTwr68rA9a0avXpH8kOd0SP0cKL7O4oerzEN7bFlc4ahuAx6PPD/+YW/2jejvwuQfHp2p/C317lhTBj8+GLWhgpNog/ly3k4y6mUfEQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmwyaXV4U2NJZkpFcTVLeFpXdm5kcVEvRkJOWXYwTDhsUjBrM2FMbmY4dDRv?=
 =?utf-8?B?L0hmSjIzL3MvYXJBZWU4NXQrREhBTXhGNXlSUTNsV3kzdHF0MVlIL3lndnNO?=
 =?utf-8?B?YUxMbVIzaUhlTy9PTGxNc2xGdTZmYXdaMTBESXZHb1pUZStMOTU4RnBQVGZN?=
 =?utf-8?B?Wk9MVlBSdjl4THdjdXpYalVXU1E5SDVDaTZNS1ZLbC9wcGFTV052U2M0OEdr?=
 =?utf-8?B?a0h0M0ljRlM2VmJyU3NnbnV3OUYwQXpzQWRaVFVkdkNyWVFPZ0d4dzBTbGZ2?=
 =?utf-8?B?NTdnYUdDZjk0QTNjVDM1aVk3TVZyM2liUTB6eGFCaDZ2RUtqR3R3OGY1RGl3?=
 =?utf-8?B?bFhVZklSdXRWcWQrTXJoT2gxdkFvMjZwQ2c1cTd0Y2pFQytSVSswMFB2ZXFI?=
 =?utf-8?B?S1ZEZmJkRTluQjcxOEN0bVlQcjZpTU9IODY1Rm5LZGI2T2s2dXJQNjhXdHRu?=
 =?utf-8?B?cXNha3NMWk1Bc2N2UUJ4YlFmUzVwRjltOVpCNnp4UENrVkdLeVVWYVVpWW1v?=
 =?utf-8?B?V2pGNjFyQ1paTktNZzVMRXBYN2FEb2ZBSDFUdW4rMXc1cWZNaGs0dWhxZ3lv?=
 =?utf-8?B?RDZPRlpnOUgrR1NTaTF5clZTd0FybDQzMFlUNkVyUnVzbjJEcjdZOUIvbUg5?=
 =?utf-8?B?VkJOMUdISmNmckF5NnAydmxoRCs1Vk1jRDg4UDkvSFN5RndqYms2MllPSTJR?=
 =?utf-8?B?ZXRIbk8waGFkeWxSOXZQR1E3UEdXZExmTGJLa0Yvb0x5b0ZoK2NQRjYwU3FU?=
 =?utf-8?B?dVRIWEwvZ2x0RWR2Uml0YzFhNko3c2FFaHVOQmVLS0k1SjJKVVdXR01nT3o3?=
 =?utf-8?B?TERJbkdSeWFrbW8rb0d2V3dNay83VG1vanJ4L0pkWkowMDlHOXhrTFF4a2o0?=
 =?utf-8?B?dnVGOUJ2UkNCK0dhZ0FjbzVhdmQ3ZU15TGp1MmhZTFMxNkl1K1cycm8wV3dU?=
 =?utf-8?B?UlppeWpCWCt1cTdxNFNIMVFBNHBBRERQQ3lWcVpmYjlndUZtMGsycXVUYWp6?=
 =?utf-8?B?Y0laT0RaUmR1MXNPUUNySXhtSU11UXpUZUJDUjd4OTQxbUtjeHlXMTBUT3Az?=
 =?utf-8?B?VzVUQVVnaDA0VFBBTnhIWDdCalMvcTU3UEozU0VQOWx2M2g1ajBrYWprRS8x?=
 =?utf-8?B?anppQjYxclBBV0VjeC9DeVdNRmZwdDNETnVLTkpYL1Y5eGEvRDR1cnZjYjFZ?=
 =?utf-8?B?TjM3NUZiZnhoMzdzdC9mNlBJUnpzODJMb3ZWWFZTd2U4dTVQNGJvd3pxd3Nn?=
 =?utf-8?B?bHlWRUZLbCtjUThLSGxIc2EwSW9ZNFQwSlo3cmoreEJpM3JiSmJCUFkvY3pU?=
 =?utf-8?B?bklsL3FJc2RxWk9iL1JDcWhDeS9YUlFZc0lEUXQxMnRKWHh0QXhCQ2FjMnh3?=
 =?utf-8?B?eXRFUWZ1WW5tallZMFY2WW1uYVR5L0M4bkFjb2ZGSkc1ak5rOXNmU2hkTnJx?=
 =?utf-8?B?RVZJWng0M2tOR0EyUzdwa3lXUzR0R1lEbDNPQy9PVm81Z015WU1EZk96bTFQ?=
 =?utf-8?B?eXVxWWVUUDRBcFlMa04xNmdCUHZCRDBXbGtHS2dQNTd2dzlQaDUzWkVGbFhH?=
 =?utf-8?B?QlNUdndYckZuUmpycHpRV0hZZlF2NzNVenBCMHRGMS8vS1I4blBTWFp1a2ZT?=
 =?utf-8?B?WE5XTFFMZkVuQmR2NnJWZ3hhQUNiNlNGblRLK045d3V0L2R2WmF5ck01eTRN?=
 =?utf-8?B?MnFnRmhKbUNLbmYybVo3UGZ6UGRWZldJVGNkRWQxQk9rRmdtcUs3cmNBMWhB?=
 =?utf-8?B?NFFZMFQ5RGgrWFFod3k5WGVKRjdvRy9TRWFxUC9mZkU2RTJINmV5TVNwdWNs?=
 =?utf-8?B?ZUFMaUlhTDB2ZE5CQW9qOHUwVXN3ZHcrUERjbHNLL2Z2Y21uOHhiUlVSbjdr?=
 =?utf-8?B?Ui9lWHQrTmhHNHppOFVjaW9qSHY2Vm1xRStOeWFpVFAvdGhGSERkRm9XbWZM?=
 =?utf-8?B?SkpYKzRsRmVKMUF3d05CM29uMG5NM2RMcUEyT1NaaDRiRTh6TjQ5NG1qZ1JX?=
 =?utf-8?B?bjZTVkdueCsySDJQZXFrK0J1ZnF4RW5oczhtT0FvVG54MWR2dm8wSnNBUExW?=
 =?utf-8?B?cU9keFhkajdSSUlWSjhMTEIvTFhkSGtXL2RHVnpoRHJ3Y0JCOEZwemd0dDl6?=
 =?utf-8?B?OEVHL1F0eTEzb2N1OTA4ZUdMRS9vSUhzZVF3WmVSSGJzVjF1d3JCR25BSzdG?=
 =?utf-8?B?WUtqR1pYcXZPMVZlVW1DSi9oK3dONDFiTUw5dHVSTkJPd2w1ekZRRWZUZk1I?=
 =?utf-8?B?NGQ4WW9udm8vMkFrUDB2a1Vidm03SDMwNHJmM0hKYk1hc1JrNUJNZlRuV0tB?=
 =?utf-8?B?K3Arb1NHUUJkSGVPUncxL2ZPOHhtOENIdXpvcDQrMzN3N1BKT2hJSlIweTdU?=
 =?utf-8?Q?R3QLxEOXmu9i2NEL5z0cR+wiY6d86lIY0bmQIOTwY7Ieq?=
X-MS-Exchange-AntiSpam-MessageData-1: 6yZbtBV4zRZZkg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eeb5ff-d133-4aac-5738-08dec6f49129
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:31:24.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBFCK5noQllQcUGKpQQWNLP1x2ENpRYRPFTByVXv/GAZKRB40PaX7hyZ840qmproU68z+j4HGsUyL3k3e6Bzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7591

On Sun Jun 7, 2026 at 11:10 PM JST, Antonin Malzieu Ridolfi wrote:
> Split the gsp register definitions grouped in nova root
> register file to the gsp module which actually use them.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
