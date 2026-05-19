Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47C33342C
	for <nova-gpu@lists.linux.dev>; Tue, 19 May 2026 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159354; cv=fail; b=G/7R/aouasr0oFWjKKvtVruY1ytefSRRPIq93yLyDJdJic5pF+td2uY0cl0tRcvhhoTqa8J9JRk1CVYDTlUuV+JN/mrlD04xHpGwPXZS8UN1r3PXq/kGxP42GIzIPnhE8rwa/EwNkTai4j3ZhO3C8iEuXtu2i8kganUh6lLuXNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159354; c=relaxed/simple;
	bh=MmZFrwvPElpzhkx3B7eWlhWS5lwpMaESQpyraoLgly8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kyruyXQYM2vBKoE+FN7QyyhUOyIaiWO6LkEcDNIN2Si7bqyW+z9j5iC45VADVf/3es9J+VTxeU0M5Nv91avuZGCyeZGSX5rlArI7Jtx8eF53ykfyCNJuRiicHTPQ1KbpAbD1fS3DlK2bk5lFPe2i3l4dmmgAfLZHa/VkzEkrHl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sua4Fz5I; arc=fail smtp.client-ip=52.101.61.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sua4Fz5I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fd2bsyifjNCZ8m/ANJK0G1rY8C9iNpdRuuHfEFssm4LX9FBO//iGDAsweTV2NfkqORLoJpwSbZMxysyNN6SCIulIe5JDy2aIgF3Vyf0tL5eMl7SlAH8f9v0KWRzCXHvMQZRe/szM1eDUqMxNeOPJtxIaFM3fQE4I6lBdADSf0XIq/+gChWM9cYbkHTWfrmnFbBWkZ08h9W3jtDYxVG6EsAoc/XYxusvltxLWDYSUGJCAyzEr+LjRDo4O4I6jCfFKM8YO3cQxELvkH3I4pAbXT2MdopQwmoUy5kLzUmEcZg2QFpCwl87NZhyZ9QGL/NfYuQWlII96L1EuwHjMl2Ezqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTg1iJZHBkZaRH2tqZXCad4yx4PTJlS1lhLyC+p3I3g=;
 b=KSBIhN8I7ngamvXwR19MGvtkoO/bECfSVEdfINx1yH/mAdJM57rER8nS6vNQqIBTgvWgL57/EIrk2tQNkUmDjJaX4+tWQ+FNNplhfRIZqibCDuOS3+x2Xcw7td0DbbxOQum8wP5wZIzYkwr0/YP5UJ0Kml6OHHDOoSqxNAy8qG/y0h2ECFGLHUAzbSsxcsfFG7idOQbveuiveTkQLeoSbUoN/PLKGjMWSBh1DGOeHE8dqVACbPsYvg8IX8VVb9p4JzIZa5sm8mQfVU710c1iASkAhqS7NGfnVlT3sdEZsl+ArNMTETkuqaPhKWT3JOFrIIlkDzvkolDzNOvLk5wc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTg1iJZHBkZaRH2tqZXCad4yx4PTJlS1lhLyC+p3I3g=;
 b=sua4Fz5IIDVnmkZYmRvlbv+VsVQDSMM+cuGgCQeGh3sHoWcuQgjHkRiomkgUWRmTczlUUyA7xKM/a0suBu0/f/jFNIfyYXNruJyeMGTv8NRkWLNzcpaeGHrBjVxjnKl+kBdQibAhQQadRqH6MQGf4h13dIRd9o0cuK7Nv9TDhYy2bZEL5dOo32b7nmNUsIU3MBfzh2URV67MCuhCjd/oKRbLOg8IzuvNDcUB5NsRz/ekdDVbMTzVVHMhcYvQ0KkwHfz/u5NYKQpNxEe1ntIeCT0dSjnXX0TtbjkV227fOEffle3cIdyChLx/bKxnDaM915ePItJD5fpOu207GsUQYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:55:49 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:55:49 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 19 May 2026 11:54:55 +0900
Subject: [PATCH v4 01/20] gpu: nova-core: vbios: stop scanning at
 BIOS_MAX_SCAN_LEN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-vbios-v4-1-5d3f210c5602@nvidia.com>
References: <20260519-fix-vbios-v4-0-5d3f210c5602@nvidia.com>
In-Reply-To: <20260519-fix-vbios-v4-0-5d3f210c5602@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: bccbf45b-aa4f-4268-fd23-08deb55221a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	o2MZPpHonIaasb31ebIfXF5sgEwazwdTGDXyeQ1Axy1THMSY95L1NkxqHEHJbU5jodPZXdWP9RW4BWsajk/ltIOyG3y2sbdA8i+6UkXX0NBa7cfSf42LbSvuhAoqE3xL/pVTgbrrf44r5+CRWJVWUOlcXKHvCa5+Qp1AwllYsIVyu3eufOwc1qNptN7nNPxBoEQ5rf0whbhYAMH4z0ybyS6vIviKpWrEk/JEAHhnqxyuTppxOxp0dd02IkixUo9F++6eNqmMNT34TADx9orQsZ/ytmzcpojKp/hBA/0XuSaN2/ylFxVTOxpRmjfVxO0xKleKaBlJcOcHZTttwIh47td3yS97itbnjDJlinGl7DUb160Sl3gIfGvgXVssw6pEPp3hYWQod+wlImKvhZWTdy3+EMQR1hyIuqpuHQLxuWlnX+FfRw2h62OwyVA/6ya799OscjTct3pGoLH+JMlPSIMQ4ZIOq0umWWCIC5deg3rTSUWruFv3xxx9rdE4kTkkyxIwhCr4OD7H2NKtQt+fuxiGiIRN8NAezK8NTQTxTWFly7D1x9y37qNV+bWaXhU23QFowGewknTIy7lJ9yG+OeUBDQKbs2HIA8mJp3Dkw/s554S24FQHumWjZ/NKe688kBjIoDWcdCOkkGGDElUawkenhvgUyaxC0fBE85yHVekh2kVjYmu7dNZsg5JhqW9k
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0tqSGltbEd2bWpLeWpxSzIzcEUzbkk0bnUyaFlDbTF2dFBGd3RlRWVPMUZo?=
 =?utf-8?B?bFJneGNqVmVmNzlST083NkNuclkyR0liY0o3OU5KZ0ozSEN1UDJZNUx6TExK?=
 =?utf-8?B?Z2sxYWpKMDFOSS9MeFNsQmFNanpROFlZazJiVHlNYXpicFNEaHJxVm9Hdmdr?=
 =?utf-8?B?MUkvMlRZWGIrcDE2ck40eDRnNlNkc3RtSHJVZVVtZmxhQjJ6TlVQMUE1S1Jl?=
 =?utf-8?B?b0FJS0dLU1BPaDYwTWRwOUVIRXFnMVBteXUrbDRiZit0MU9udGtyVHljQTM4?=
 =?utf-8?B?QTRXek1zZ2VFcys0Z2ZGUUk4VUNMWGFEeS9Ya2xwYnRVaHgxVHNObkVZMGlU?=
 =?utf-8?B?cDFLV25KeEJYc2kvVGhjclNLb1kxNmQyWC91dGEzY3BRaVRYQ2J5Lzc2eW9q?=
 =?utf-8?B?U09BUVVvYUZueXV0SXE0Z3A5ZEErY0VTWmk0dVJrbmlHNFFnaVFYRXAxRnds?=
 =?utf-8?B?dlVZRjU0NU5PTk84c1FPMzE0WklXSUxFd2tOYmpyVmNNejdlMXRKVCs1Zm5L?=
 =?utf-8?B?c1RhcHlJMDR0UmN3ZXE1UlBoTzZpcjVTbEtaaHdUanMzR3BVbzlHaGUrNW5y?=
 =?utf-8?B?Y2VpRkVXOEF0RUVyZjFkSG0zdkxaZ2JKMWRyQVFSUGVuTkR2S3VHanJaUUxs?=
 =?utf-8?B?QjNVSGl1eFRrQ2lBakJsOVJKTlowbzhTMXFibTNZTGt5dkpyVUM5M3p2V2J5?=
 =?utf-8?B?ek5lVCs3Y3FQMkpxSXpoaHlnQ2xJVWtDYTNkT2ppK01BaVJpamNMckgxNlNa?=
 =?utf-8?B?TlhRcnVzQzVxZkswMlhobmY4RjV2eWlQZVJ6eHluMkRGUDdRN1dJUGI3ZVJU?=
 =?utf-8?B?QW0vSmlJQ1pVSDJTemdqaWdhYXZtUnNlTGx5K2EzNDZDcXUxa3F5ZWtZQyty?=
 =?utf-8?B?YTliQXh1MFlnTDR2N2xIZSs2alhSRnMrczMrS1N5bDFDaks4eU5EV2U3Q05k?=
 =?utf-8?B?M3FGYzYxQlRaNXAyMWJ2UkRxVTA5ckFPQmlsb2VCeHR4TDFkQzhSSEw2bWR0?=
 =?utf-8?B?SU9hdC96MW1JQXRVdU9GVElpd2VHY29TTmVFR0hIeDRlV3BpcDVHeUN2b01G?=
 =?utf-8?B?MHZ2ZmpUbjBTVHI2czBNcDJkbEs3RVZZeWhHay9iWVVGZXdpSDhZSTNrTklk?=
 =?utf-8?B?VDI4cEhncVRXMC8zMlhOeUI4YTJ4dElaTDR4UjUzYURkMk5IS1VVVWFhdGgr?=
 =?utf-8?B?RGRER1F3c21QRENpNzB1VXNiZjFYb2RBRTYxY2dCamUyVEI3ZFd4NFVvUWtv?=
 =?utf-8?B?L0xWOUpUUGpSVC8rMGhXVWRDeC9iOWZuWEE5RGRzTE1aRlJESzQxaUJodnBG?=
 =?utf-8?B?TUhXU2lCM2dFcmJrc0tPVGN3MTM4TzNQeEpER21GU2dFRTFhVFo0VmREV2VG?=
 =?utf-8?B?Z1p0bzNvYWZWL0crV2VET3gwUXM4clpYRldkSHVaSGJ3YS9pY0hGM2prTXo4?=
 =?utf-8?B?bi9mK3h0bVJrTmlWRzZlK3pjU2RSc0ZzUWlVbERjQllpQlRjcjNGRHdiL05O?=
 =?utf-8?B?N0FUREdEUVM1V1kwSE1uWTllMWVCNmtkYjI3SDdjM0ZaUXJNcm5hOGdacnM2?=
 =?utf-8?B?Y1JHTTV2ZFlBQXZHVjB4OWJQMU1XV0xUVUlxVEtQOExRWENFRFUrQi9rN1hq?=
 =?utf-8?B?UWJ0eFVmeTFjeEhNUGxUb3h3UmlCZW9STzVvVC92dUVKc2xSQkdhMit4VzBV?=
 =?utf-8?B?dnF3c2dpM0NKSWpabnR5K3RIU0pJTG1mY3VIN3JnTGFOeWx5eUV3dDRwQUFF?=
 =?utf-8?B?eWhyWXk3TmErZjI4V0s3cURlQktyWkZCV1d3eTlIclRFNFR1cDVld1RnREVI?=
 =?utf-8?B?WTYydHU1S1NYVVB1cTBUeEpaNHVidFBldFg4N3RpVXBQSUUwbHBTRTBCeURu?=
 =?utf-8?B?dTM2bjBVRWcrSmd5R2duTEMxbUpqNHZwbXlJc0xxWWo0UTYrY0NiRHJpUjNk?=
 =?utf-8?B?Wk5KbGRVb3h6dS9ZYmN3VGtaVzVGMy9UM3dra1EvWnd1TmRPeVlEMzl1NWxs?=
 =?utf-8?B?QUdRME9kSHk3V3VSaVYrNXNmYnorNWJVelkyR0RwN0ZzamlIUXhMUFMrNDF0?=
 =?utf-8?B?a1g5dWl1WEdxci9SbnZ3elZ5djNnTlJUVjErNVBKOWlyUUVTcktkYVdqcUZv?=
 =?utf-8?B?YTFtM3pJSlN0MGZVb1FwTHBKRUpOR05OYVp2bXlYcnZQdjNJbktZdmduODVw?=
 =?utf-8?B?ZGl4UEJDTE9HUkxoM0ZvL3hMdHJjODR3aGZ6dDZURW5pR0s0elNxTk9qNE1S?=
 =?utf-8?B?cWhMMzBkeVBZY20zNVdaaVM3VDN2KzhocXp0WGo2V1FwekZWamJxNkt3SWZ2?=
 =?utf-8?B?YXcwWUNOVmxwQklyVWh1dlRsRFNydlBoSnRtL05TUllvUENtYUNVcVp2Q2x0?=
 =?utf-8?Q?FJeYu7mCuC1VZUcE0u1wSMxeN6KPqxmoTZngKkh8XLYAW?=
X-MS-Exchange-AntiSpam-MessageData-1: vSsdoRYVoTPCWQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccbf45b-aa4f-4268-fd23-08deb55221a1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:55:49.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTtI7f2RSRNbJPx7RrNgmntG98omtkf6QhIqTR2oWfh2/MK55o1D/DJM4VipLyk3tFckQZ3NLMm2vF2sxRSwAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251

Current code lets `current_offset` go to `BIOS_MAX_SCAN_LEN` which is
one byte too far.

Fixes: 6fda04e7f0cd ("gpu: nova-core: vbios: Add base support for VBIOS construction and iteration")
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 6bcfb6c5cf44..7bec81a37340 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -272,7 +272,7 @@ fn next(&mut self) -> Option<Self::Item> {
             return None;
         }
 
-        if self.current_offset > BIOS_MAX_SCAN_LEN {
+        if self.current_offset >= BIOS_MAX_SCAN_LEN {
             dev_err!(self.dev, "Error: exceeded BIOS scan limit, stopping scan\n");
             return None;
         }

-- 
2.54.0

