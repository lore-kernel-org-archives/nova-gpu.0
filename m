Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D63E639B
	for <nova-gpu@lists.linux.dev>; Thu, 21 May 2026 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371483; cv=fail; b=KiS03dp2Z/M1tJaBADwAxh4eegnztAprZEIwrAF5GUpTryr2LnkXlWYdZjcOHcaKmeNnjJHHNNk9uTZ0xeArYdcGZ54jIGwgZY1aZYb4tdDtv9e4vb1nCTXOOe6FlHDYgWkklJodZpl5Sm0RZBqIGP+FEHyDDx0ocC8D63N+Q/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371483; c=relaxed/simple;
	bh=ORZA+AFCs6V0Y/0i26edY+AJqPxKSLxNDVCSkVICMQI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=itwwQOOCeE4gXhUNjsX8HljiTYuF98qUnQN8YwGa84fOyqpG7w2GfA17UKRWf0UyEGVBOEjDiYmcFGPTMyFBvF4wJ136RRPDNnijI40Z0ZDi4RyJhUX1eSNMaaS5kP46OxEsHlfDqkHVLdluTfl0DNinc1uiyhTNLHGunGR8tj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kEPkBTJY; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kEPkBTJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHyqrOIfilfzTQOMlBYEC1Vq9dtpbAVA51SAQHNDCRpBkacrMElCblYmrFDWzasgUrahcFTT5rDQoyvGxdOCWRLO2UiDDsQWDZHR2lcOFWwVCdmoF/nZwxQ6AumTB0QEfbfCzisUKryt6HCGxPU2QNTZ4D/q9M5QziyBuqdZC86koNRsl03z0FPmP5+SuEdBBILR81Zb1sLnWgyMu7o0q4iiHtvPd/CrNj0LGVf2tfC8Ku/tYy0noOTT8X4NflYFZ2SAo/B/Kn4unwBIFrZEpIQLZZQsj39jBehv6Ur1hxc4Z49089fMBnew33QtGj32trb6v5xtbF2Z+OPd7GKmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuinCXQ8RD5uPDawHyuJpzsB6i1kOHkL1sG1WnadxL0=;
 b=Nsr0rl6PmrkccxkaKteUsEN+NIfr6ZhSI9SMvJsCzirJ+RFRyj31dguHXde2BauauJA2JlWHz7086b6patYBJIwNyVpvuVfJH9VeLhmPKcTT3sMDKWwjgo+H6PhpG/oD3w2wBYAP5E1lEL7eBprZUyvGIj6OZu48zYF7zWnBm/Z7X4CD1my1P6HZQbMYa5lChAOi2gYytivxsfWc2enEVFaPFVtlFYQXVNisTNUBVY9tS/iER6NUD+SNVMWvq6Z7KDlvw13PyOM0itWytQROp4k8xV8gXMQrrCfEXpD5ZKcF1jHaGKVb9AqneBQrVO5XxbwNFQj/Z5EXIkvtAATC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuinCXQ8RD5uPDawHyuJpzsB6i1kOHkL1sG1WnadxL0=;
 b=kEPkBTJYeTWtG8OGvpk1g5OoFPPIDiqoFMcGx3QocqW+EHxRTNpxutNlN/rkeOG1g65kn1TI70icdkNfIjj6E7jOtdnVbuKbl+r9ExCGO8vLOJxjkoO1JAxKmLClhgQb43601maXJfPaTGuiwmMQhoEqdIimcHCTE/qcduepLFeK+DmRqlTgqo1OGC4Nto9Otpt8miKYQ7XNzM0IdRroqlqcROtIcmabidHHjMCEndkhu7Uxp/d7LTRRwTYBuPWzg5fA057ZUT/f2YFQjs1M6bsFQKOHTxCVhu2V/zPdtMl8oeCeaOv0cdH318UHUsitjtyH0GMj6dn8jYQgP9R6qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Thu, 21 May
 2026 13:51:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 13:51:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 21 May 2026 22:50:52 +0900
Subject: [PATCH v6 5/7] gpu: nova-core: gsp: shuffle boot code a bit to
 keep chipset-specific parts close
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-nova-unload-v6-5-65f581c812c9@nvidia.com>
References: <20260521-nova-unload-v6-0-65f581c812c9@nvidia.com>
In-Reply-To: <20260521-nova-unload-v6-0-65f581c812c9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 504ff5a5-2be2-49f5-3276-08deb74007f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|3023799007|56012099003|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	jEWzYYrrYXao9m+EgX1GNlQkytOl3ifMCIsqw+xq2AbGUxfV5pT/I6YSAMutodqBVfgQrCqTjyQ6MiIEr2AH4AFSNu8c0R19cDO6WAJBFNAl7yyh8Wk//1Ko/3uilqOsfAGHSA3N44aCSQwjBIcfzcmLB1bQp1gkgc1xEl8xxmbcqWiutwCVZkrgyzuip1An8I7vZbxxBM9eoWhUAjcCo8idz/2O/kSSAaaU3UW/Hx4o2WhgmPPcEYw/Gfq/EbZ4ZHKSPRg0DW/iZbQYZ8QoJ34LsBLGnGmcZNu0hSaNC3/tDpv1WFwyr8qfOznWqLFtiHjGupJXoS4mtf65y/0zub1MyL0FivTTH/raSFVs2zaPOXVaiufT3Ip5BCz3DQA1xeQjEA1ToWl5b4QEwToeLiNsVUU8verPvGuq0AHHvuiWjbIjPSc/Z/dIUVh3nRctGmREct9c+U1vJm3SFoR/DTyix5HxaPDwlgXfn/0u2Shxo1MwHzc5RGc6ov9NTHOS0u6VLJJZgznmqk+rol7bIuShRd16oKGQEjStS6aVynFo40E6b0wOGmCj8z3GfwbR4+qrjEXP4QHpRqWSqgfmXy5hNblysqSZLSXvCI95GBhjlF/4JTCMHuWa3UlAMgusVg3SiTxn5G2gHiieSYpXcp3vweSgDAVebnsfhPOUvh0zKCGuzCrgGP+6FIYfMobs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(3023799007)(56012099003)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0ZwQkdzRndnckZUT0hVZ3FrSXFEdmovRGlKKzlVNldhMzFvOFYxdEJ2a2J5?=
 =?utf-8?B?TGhSUjBHVHZGWHRRck9ZU1JNdThpZVd3QmtvZlJVVWJKSEM4cHJYam1yNHVH?=
 =?utf-8?B?MTVPaEYwRWpVRGNPcHZVQ1ZXUnBxTTd5Tk9NMmNOVGU3b25aRGprTFcyWnhl?=
 =?utf-8?B?NmVpck5xMjFJTkUxZ3V6dzZBNEpTMU1uTUFKc2V1TmFXMFdNS1VYNUtoMG9D?=
 =?utf-8?B?eE5FWXRORG9WV3dZYmpucVg1TENOb0s1blVaaHRsWStCUzVnN3pUWE9OQk93?=
 =?utf-8?B?QUx1WGpYdGFoVG1uYkdXM0VaRjloVXR1Ni9JZVU2ZVVvdjBlVGtkdStvNXRa?=
 =?utf-8?B?UWpFeVlPTUx0YWY5cjZXL0hVN3lBLzZ1a1VhbGl1UGh1RDB6VXE3TUZqVWhM?=
 =?utf-8?B?SnNwdkpCNGZkUHk0bktlNDU3Z2ZtKyt2Q3MxanFETGhkWkFsdGg2Z0VpWWMz?=
 =?utf-8?B?M0hLZkdCMGVFenNZbnFMRWJzeFc3MlBsVTMvd2phWEI2d1RZdjVkRlk5RXVa?=
 =?utf-8?B?c0hubGEzVVZ0Y2xaZFRpK3NDcmdXUm5FZXRkd282UGdGSThxcEE3Q1d6RHFR?=
 =?utf-8?B?RGx2dm9KMXZkL3dUZVhnS2JXR3lPaGZ6dzlNVUZ3YkdPVDJYZVNQUTZmaHND?=
 =?utf-8?B?c0M1OE9NcXV4UklQRE0weVZESysrVHlnQ3NPUkNQcnI3L1puMDkyUm0wQ0lR?=
 =?utf-8?B?THV4bVo5QVpoZjh5WjEvV0NjcTdvWTFCTkFsQ3hQV284eDZjVmlsQWtHd21z?=
 =?utf-8?B?aURYUTVVRG81dC9oVDRPTDZlNXlSK3JGa2dWNXcxL1d6c045c2NrbnBURnBL?=
 =?utf-8?B?MjVqR2x5YUk5VUFzSWxldnFVQmpIN0VEU3VhNUFGeTJmbGFnWGFFTklkRXJO?=
 =?utf-8?B?SzUrTzhHeU50R1dnNHdJREU1YW9HK01JUCtYUDFsdVRiNzZWK1JCdG95M0lv?=
 =?utf-8?B?SG1OQitaWnI5TVpQOGszN1JzMnYxZnkyaStCMFBnTUFiZnBGeU8zdmtsQkFj?=
 =?utf-8?B?TnNTa0x2YzgwSGZaNXlMWnNaWks1RmEyeDYxVEhlamF2WUtIZHFlOTVxSnpF?=
 =?utf-8?B?emQ0ZjRvOTFxcHJUZzJxNXZDdU9DV3BzelpWLzU3b05oTFU3MFVTU2RDdkVK?=
 =?utf-8?B?Yko2VFh6QXhYcnl2VHBnK1FST2ROWlVuT21oUjJUZnZ1elUwQmRQMmh1dlAr?=
 =?utf-8?B?WVhGQTYwU1d1WFVvVW8zZ29yUW5ycEhqVE1RWEtEemc4K1dOa2VZK3A3MjR3?=
 =?utf-8?B?L2hhZXhwSFlwblBCTTd1UWxGeHVndW5zMktFTFNuSWhIaStGc1lhNmQwejJi?=
 =?utf-8?B?eDR2dmVUM2UwbGFVWUZRakE5a04xaElKY3l6MGNBV0xiK1hUR1FmRkFWZlZT?=
 =?utf-8?B?ZGRVTUoxWU56MVNRVkxtY0pudElLdVNiOG5zeEtXQkhBNm5IK2NpRXpUYVYx?=
 =?utf-8?B?UUF4aVp4VXJmMlBhQTl4ZG15MHA4WFk0cGpZVGFhMUltRUp4SGxJcWxOQ1dv?=
 =?utf-8?B?SWVRaGZtVE5pT1B5eG5oSHFIeU4vdzlQTHdhS3I0M0FjSnZJZG5mSDE5ZjFR?=
 =?utf-8?B?eXNBTEFvRjNxWi9TZ21IaHFDV0dQYWFrK25pT0ZCbUIzYUhBZkRDMXZaUG5G?=
 =?utf-8?B?ZGFlWEE1VVBxTkNsT0NJWk8zb3FtUVJsVnArNE4welN4WEp3am85K28ySVc0?=
 =?utf-8?B?clpQZDFQOTZoaUdrOUJtbWhCNGs2Tzc3OURNeks1cHRvRTJoRVBPSDNIMGRp?=
 =?utf-8?B?OFB2RlVaU3NvaWszODJyS3h6d1krZ1dpUXBWQnhhbFp1eUxseTd1RGErcllB?=
 =?utf-8?B?RFVxOTRWR2J2cERsMHVCQThPQmQvQ0VRbEFoWXN2eFhZb2NEbG95NGh0QmlR?=
 =?utf-8?B?aDBucFhPUHZDOEtnWWxycFdyY2IyNytSd3ZrMnZkS1VwcmRKaU1CNlpnVW9B?=
 =?utf-8?B?NkUvQ2I4TnI3clZXdFkvcm5oUWxhVldBUEZjOWtWckVYVzZBbURJVWJtbkpH?=
 =?utf-8?B?dHE1SlFWcFJoSXgrZ2xVekkwem9ZK3BqdHByOWJNaXlyNGJpMTRNa09nZFpj?=
 =?utf-8?B?bXFja1llTXZKRHFpenV3VEwyMnZWS1B1TTV6dHl5SDJ6dlFxWXZLR3hweWFM?=
 =?utf-8?B?d0IzUEp1NXZBYXNyQTUyMWRTenJoaDZyR3BrM1NUYUF2U1lLcjNqY0lFekZD?=
 =?utf-8?B?Kys1RWVYYk5OckpXeHZYdEVlZDB4MXc2bmlqTVZKVldsUlREdXFObVRmTDZ1?=
 =?utf-8?B?TzRqL2RiTDcwaXlyTGhnS3NJT0Z5ZHhkYmhscFdFd3FxZjM0ZC9FdnQ3V2dk?=
 =?utf-8?B?M3dMNjRaYUtSS2tPNnRhNytSTWZWUDJWR01zcWlnbUlCL0lqd0FqdlZTQVdq?=
 =?utf-8?Q?jf7TP7Vqbc/nSp2PdaBPwGQSoib1d0ggXdpZGaTx+DHXP?=
X-MS-Exchange-AntiSpam-MessageData-1: ueSapNvwAhzo0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504ff5a5-2be2-49f5-3276-08deb74007f3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:51:17.4350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O12fk9sybwuP6mSl3YHxcCF0MhI2mUF0o4lFv5swalzGIzdBxd6Y3ookgtuPVxvR2yA530s+elDpkwwzHFu73w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905

Some parts of the GSP boot process are chip-specific actions, whereas
others (like sending the initial post-boot messages) deal directly with
the working GSP.

Reorganize the boot code a bit so the chipset-specific parts are clumped
together, which will make their extraction into a HAL easier.

This has no effect on the GSP boot process.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 4f654e10259a..11b1cd2db8cb 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -169,18 +169,13 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
+        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+
         // FWSEC-FRTS is not executed on chips where the FRTS region size is 0 (e.g. GA100).
         if !fb_layout.frts.is_empty() {
             Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
         }
 
-        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
-
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new())?;
-
         gsp_falcon.reset(bar)?;
         let libos_handle = self.libos.dma_handle();
         let (mbox0, mbox1) = gsp_falcon.boot(
@@ -217,6 +212,11 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
+        self.cmdq
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq
+            .send_command_no_wait(bar, commands::SetRegistry::new())?;
+
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
             bootloader_app_version: gsp_fw.bootloader.app_version,

-- 
2.54.0

