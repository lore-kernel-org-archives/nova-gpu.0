Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29373D331A
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580220; cv=fail; b=VlgegLtyU78AOCMRDbwRO/Zd+tslhflrm/+1YmLupnC6p+C2GJ7um8rpgkwsgamcd0YsKQT5OMbFgoFzRllgVN8PtYvNjxtFrGb+hiOV4SJ2w/kwPtkJxI4i7weXBG1sfsiorSlgS+2n/w71bLUy8NrzBJaskxmQt67kRiZVelg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580220; c=relaxed/simple;
	bh=TQrbIdYbLurbSCeMwF2Jggtvel9Yk1jEJpwQXyCX61Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bqn3ZUJGbxRK1MYqTr6yw1no7Wmb/Tz8kOOnnBaTOVPX7no4hUj/mxTLiyxSk9tCYOfFIbUVryiwTPa2tpbyPCyzXeCSOcCKXaIJL/oyiIWHlcymrJaslCpI74+L3u+owIE2lObs4EmWIltPo5dmwj81wIrbvCzC6DbVEKT7I6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZBaPaqx0; arc=fail smtp.client-ip=52.101.56.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZBaPaqx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYlO3/8bRIjtnt1OgyqXeEzonLsveUUFHM+WM88qGxkOcvEvgUyrO8+4jAdbxB/WB6tZAohUKJ+WaBBEG77zQYWm7fd+0tP//ERHEBvBMSn7QiuEziVmSLG2vo8t7pES+YqhqK4rjFcDRXv9W8P/BwyMD1TIf8P5cdjJhVqi/YoVXzx6ZdyQT0GsGjMSV298FglguQFkvdFU17qEju0RC6u4WZmq4aOU3OuqrzzWyuk7y1PURlbrQ8XpNl3xxYHjF1tyAphw6EjL7ixywSRPjDI4B8KSWVnt6xu9GItd4XY3/o8SY6jEVX8UWXWy4oTP0oUeKGqYGXxNh280LEUYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eab0giu4fhx91UrmsbVxlivoB7bWl9XEVKF+JRQyEQ=;
 b=ypPYfJIv2dQk9ck7h99WNldPNivXIl2OwpKrPOpKU7ZWMaAkbIRMwoBlMjM+InGdHPom4kJEXqPAagG7RgeM3g5GtgI/BlE/gqQVAPgGqhl9wS5vpsxeJSQH8yaVL2+bCZG++eQCx4BaSrTodx4vLjQk1Ksdam7uRW4cJ8AtduebhxeEL3j8y0v+OtC3QzRcUZNDlzolxDEApVaT1H8ZCFkcMKAKf+nbRWB03JZVnhHkrGOkL9Jx+wkVSJ0jAJ8EeKA2mSwk4y+5y8UVpv7A9T6R0b3SLhIe6BDO2iyt3KGSgDwtuw5bqmEgkVo6hmbn8Pz8OByJWZkWkB93UIfggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eab0giu4fhx91UrmsbVxlivoB7bWl9XEVKF+JRQyEQ=;
 b=ZBaPaqx0+bNigLa284Fb9ZgmR33pBirruuVrYZf/7L+lhb2m2xJvdS9dFT7D6vBZMcQml1ye5R2fe4HfMgS3EO+GOw8QOdC7npaBNCUQKeu1E32dKk7SLF83TmLDPL0hKLHQ8FR2pWBiMX8+92MtNGcsxIv5RZKnDMs9L7MJGgiVE7EWavj7dILNpaCtVoG7U6ZDJ1QdAjieiDY2B60qf3aib9HmKokD5h5qHghoUiTglfVTgXJTqcabdvxbA0Xftl+SfzeU1tRV0tcYpGkElyG+b+rGow0QF+JjiKMu48nHDgccxuoURDiKMOmu/88r3xBE+JfsZigyMs3U9DvVQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV8PR12MB9668.namprd12.prod.outlook.com (2603:10b6:408:295::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 06:56:54 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 06:56:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 09 Jul 2026 15:52:58 +0900
Subject: [PATCH v6 05/13] gpu: nova-core: gsp: centralize missing unload
 bundle warnings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-nova-bootcontext-v6-5-520cbf8b9b50@nvidia.com>
References: <20260709-nova-bootcontext-v6-0-520cbf8b9b50@nvidia.com>
In-Reply-To: <20260709-nova-bootcontext-v6-0-520cbf8b9b50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::8) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV8PR12MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 97743d94-95d6-4453-d96b-08dedd874294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|10070799003|1800799024|6133799003|11063799006|56012099006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SNqFC03XhIqiCJFnrSwZbyMvI4iEqGisUEObG3CTyrKJopKcUMXPEu5C3NJKuwhEEhPuqA5fPBoFD6lBiIi1Vk2gpmrgWS3Oifh2sJWck6VPNzaNY5N8+Gyzs7YJWMKAJCP0wpO4rCV3bbDETkuKx2RxndxBxLwQyxK9gLoTjt/76DYkVM5KwoRTgMUn1xNL1Jbyb6IeYTA8hI5XiscejwWcA0p0vQ+KpystvBUicdHMPAldxTmcJPSy5FPf+313RQRctwXMln/nROfo7+dnGChxWv76j5qOFXCFpnlGE14QyczERb/SBZ4DPAEee8BqCoWW/hHwvwAOl+VCUslsVxALYrtogTcBaa1QXShVpGtRcLCEpA6aqU9PLM8AHEKRg3Dwa+d83o7YMBv/MeBRoy+kwXx0+NOTwbeVF988o5p1/FO9G50ZfBZxBfbJL0LYfmq7EIt9rgj9OuB/Ksea7hgDQWQd9mXbQCQl179n2MpL5c7RUZeUVO6XypWexP414nuiSMarRvevixHyqyKnMT5EoeQIXmuWjEfq8E/SLwR2H5FE0m4FZvR4YJFhnlVHLeLEJ919PHpRLeow4YnwNsd8nuyrC+q3tqz6jheRcXcsCLCuuwa1ZqbIdIRchaE9+R9hge1jXIl9vhSsWMFvruP8/un4e4toSEQguVp4CnhaDiyVYHL5I3MQi3EiAGp0GEbdJ3CxfGXCRL2Mnn17bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(6133799003)(11063799006)(56012099006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2RqWlR2Rkx1ZjFrUEJBcnNWZmlIWEFFcEtVZGRCOEZ4QmtNNHNuM1NVZmM1?=
 =?utf-8?B?VFdmelJ3ZlhHWWZudEFaWGtGWi9tNU9HUm9udDRBbWJzeUROclR0TXV1c0xX?=
 =?utf-8?B?TkpqRjd0UlRVQ0hwcVhaR2ZoU0tURGdDSXg2MWNwN0RBaW00Z3JLTkZBbkpR?=
 =?utf-8?B?c1VIelRIT2RlR2dVV1hnR2ZvcG5KQndub2pkU1pjZmI4QXI0NVNtckZjUGli?=
 =?utf-8?B?ZlVjejVoYWpzMTVneGlOdXlKTER1VjA5SWg3UXRxNmRUaUNKcTlhVUh6RG9k?=
 =?utf-8?B?R0JTZ0doWXpuR1VTakpTYVE5aFZDdU9GN3hDQzR5SVJvbjdGR0ZBSmVET1RC?=
 =?utf-8?B?YXA4K1ZMUW8wVnNjWHBRTDNNRm1ubVkyaUMvaklZYVl2ZkRDVWJLWmMzT1ps?=
 =?utf-8?B?Wm9va2hVMGV6NFR1ZTBYa01rRFFlczhkdytuMDNSTml6NDZLMVdUME00QnM4?=
 =?utf-8?B?VWNxWWJ6NlhHYzBnaFZUZVlwOUYvWDIrUDRmL1hyTVI1WW9tSFZZMmhaRmtR?=
 =?utf-8?B?aSt3YXBWVXRaWXZJNEhNcUtMSkNvaFhZejdad28wWlJDU3hPSmVld20xRU9y?=
 =?utf-8?B?Wk5YRUR6K3IwMHFoR29DRjl4UUZPMzBhRjd5RjlMQjlQTm1lYWxYRlJjZzJz?=
 =?utf-8?B?aUYxRW9UL2YrZzlaMGhVZ3lyNjE4Um1aYVJ3emVUalBxVGw2blNaeFdhVWlU?=
 =?utf-8?B?Rm9CUFArWDdCcS9uZXNVZ2s5d1VEcHpEb1RPR1dBUVVycTlFdUpGMlphLzlY?=
 =?utf-8?B?eVVPOGIxamhyRHpiMXVDY0d4Q2ttYUx3bXdqejBhOWNMKzQ3UzgvQWMvMDB5?=
 =?utf-8?B?dklaR1dmdDNudndKQW14NFZRU1JGWmp6QzJKZWdYZElCckdHQmZLNzZacTYw?=
 =?utf-8?B?Kzc3VlppY1JpdmtvR1hyQjh2U0RrdlNRTlJ4MHFQYlhud1l1WnE3c3RaVUhh?=
 =?utf-8?B?ZWF2U2ZGZmV4L2IrRndWNzZVZ2g3VWtVekNtbWk5cmxBNDdYYVhpaTRjYnNp?=
 =?utf-8?B?YTdTVHFML3RFK2JxRW1UUnl6b2xpdVBmWnZTMnYrdU4xcGxKalluYVA4Mncy?=
 =?utf-8?B?WkhPNzNQMGttamFqRnQ1ZmwzZlBuSzVrZGxLRStZVHpNRWRsWFFlUGw1UnJP?=
 =?utf-8?B?ZEVkLzFLNFdjQU04Vnp4Z1N6Q01KMXJDOGMrdk44Q1lTZUVpWEJQc3dDaENn?=
 =?utf-8?B?eEEva29tQ3dyTGl2ZjdpdWxOenRlS053Vy9qZHRtN3gybHlFMnNjS3RTOHVV?=
 =?utf-8?B?cE9kVEJ5RWlJRDQ0cStjbkswQTdiaTMzZ1pad2JpVGtNd0Q2U1ROcnNqSUpY?=
 =?utf-8?B?TGN6NVp2RmNwNHdBWlJ5UDc4OFhYbGRRZnlRcmZpTHU4Z2FaYjNqVThOd1lT?=
 =?utf-8?B?SVBWVzNRRTlVZmxHQ01mUVF0VlZBekxiOU5FOThjOE4wWWRibXUxKy9oVVJm?=
 =?utf-8?B?cnJockU2eTcrbFZoZTdEWGxoVjFkWldYaWRqdXpDTmwvcE5Fd1dSNjIrMFkx?=
 =?utf-8?B?YnlBRGpIaG0wcnRPUGlDa1BwRHdlU012elVQZGxKYnk5d1p2cVpWM0ZIRWlt?=
 =?utf-8?B?ZWdIMzcrRFgveVNmdzAyYVdrWUtlV3hBeEtXRTdjanJyWUFPMGtMY2hqbUo3?=
 =?utf-8?B?cEpRd1p0eWROWGhtMjdOY3czNHRySm0rRk1iakFYekgwc0ZvK3kvWVRab1V1?=
 =?utf-8?B?NVZlSnhUNTUvOENQQ1RmNTdCTDhDV3JxYXlvZHhjRGxneEtqQm81VUwrZXZV?=
 =?utf-8?B?T3BVTEc5aEpDOUNQK1dVNVN0c1NnU24xcFNYYmViVWlWc2xQL0phSitscVZR?=
 =?utf-8?B?STVBZWpIdnkydUszaVBoc1dLUHpCUFlhdHI4ODFyOWYwN2xSWTB1NWZhbFlQ?=
 =?utf-8?B?ckJzTzU5Q1pyL01DUGQweEFCVCtkMmJMcFB1OFZtQWJMeW5MclNzbERBM1dB?=
 =?utf-8?B?TGhUQVJiaWRad0JFOTQ1MkNsUlEvc3p2RUpyVVdvZ3lPbGZZZUc2dUNRU2Zk?=
 =?utf-8?B?Mk1xbFZSOWZ6OVFVOG8xQW1FbVdlL2J6anY5N29xSmdCcXNDOGpYSTl1cHUy?=
 =?utf-8?B?b3dEKzNaVFBia2x0V3N5NEM0OUE3MzlQUVV3ZGpxTExPK0lYcUdCdW4vSjhs?=
 =?utf-8?B?SDI0bm1za0h3TjBlQUxROTRJajU1SWJuWEg5NWpWSXV1a0pJckpJRjl3b1Rr?=
 =?utf-8?B?VXQ2ME9XV0VwMC9hSjlsdzRjZmRNYzN3UGw4UllYVGZLZ00zZnRSY3daQ3Fi?=
 =?utf-8?B?Q1ZPY1Voa2J3eHQ3UTlEQ2xjcWNvSGpwd0VMTzdjZ0pQcUhaSUhlQmovcGxa?=
 =?utf-8?B?M1c0d3d6L01MRDhPaStUYkRvK0E3M3dPOXpyRDZDUjV1UnZ0U0dWQ2dvNUo5?=
 =?utf-8?Q?4Syd+3DAwqoeU6s/cuDQelk0s9cb6o/75OBvzxQnU6gdC?=
X-MS-Exchange-AntiSpam-MessageData-1: nts1divwzu9oQw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97743d94-95d6-4453-d96b-08dedd874294
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:56:54.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaYKD6FsjcPrwCxYpa+ajjjoEBbxvMJIE66vMNgs+EyabdAwISCvnenyL96NM4IPQsIVlKe6XAqn3O6eFnhuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9668

The warning emitted when the unload bundle cannot be constructed is
valid regardless of the boot method, but it was local to `Tu102`. Move
it to `Gsp::boot` so it applies to all boot methods.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs      | 10 +++++++++-
 drivers/gpu/nova-core/gsp/hal/tu102.rs |  9 +--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index a23219a79355..75488a8e3c0b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -56,7 +56,15 @@ pub(crate) fn boot(
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
-        let unload_bundle = hal.boot(&self, &ctx, &fb_layout, &wpr_meta)?;
+        let unload_bundle = hal.boot(&self, &ctx, &fb_layout, &wpr_meta)?.or_else(|| {
+            dev_warn!(dev, "The GSP won't be able to unload properly on unbind.\n");
+            dev_warn!(
+                dev,
+                "The GPU will need to be reset before the driver can bind again.\n"
+            );
+
+            None
+        });
 
         let unload_guard =
             ScopeGuard::new_with_data((ctx, unload_bundle), |(ctx, unload_bundle)| {
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index c0956fb1c9cf..ef465b99af05 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -278,14 +278,7 @@ fn boot(
         // If the unload bundle creation fails, the GPU will need to be reset before the driver can
         // be probed again.
         let unload_bundle = Sec2UnloadBundle::build(dev, chipset, &bios, gsp_falcon, sec2_falcon)
-            .inspect_err(|e| {
-                dev_warn!(dev, "Failed to prepare unload firmware: {:?}\n", e);
-                dev_warn!(dev, "The GSP won't be able to unload properly on unbind.\n");
-                dev_warn!(
-                    dev,
-                    "The GPU will need to be reset before the driver can bind again.\n"
-                );
-            })
+            .inspect_err(|e| dev_warn!(dev, "Failed to prepare unload firmware: {:?}\n", e))
             .ok()
             .map(crate::gsp::UnloadBundle);
 

-- 
2.55.0

