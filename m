Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07473E1728
	for <nova-gpu@lists.linux.dev>; Thu, 21 May 2026 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371479; cv=fail; b=TDrR0tQw0eO0gTA67IZn7kv1w0hOOoFR/xj6/kPyyIBeY/XIYh0LAZ/nFwlgW+T8Q8C4OfBjAn14pllqV8+XHYqY3a0BtYYvRFjXdkaMfP5WGqlq2XkUHyRNMdws/4htsaSaNcG57DN2lyk/TkoWxgo3Gw4H+kun9zvWHozOZdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371479; c=relaxed/simple;
	bh=XKaQ7SokcBUqLIeXRX0CfAxTJT5NnfGZleVu3h5fVNQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Gct6CWohB3z3Y2MFo55W2yki7ilC3KoIc+YO36eXpM/szVPaVhjgOfYVd7nI2a+fj6ouvORTFxs7+v35Z2TX2r1gnf2yG6Cn3NdwU6U+nAR1nb/AbSrKV3Dc4dTOIzvhmRY9sKPVVJ1VIErLXT8gAkOL2Om9RsM+Zto3IOr4v/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pmCJXKoA; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pmCJXKoA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWjCJuiKh6yo8hUdDoJkBpuh32i5zAHkxLlssbs3Sg3xqncodkYQttlBZfzainnMWwRYKCOeDaU2qmjHZDB2uMDS39KrB/uucttluTxhL5nUbp4HjLl5rTc0xehHjHWbJMtnfBgBM9Mriq+IHq4tubiqvHWCwOogkbkLtbaRa53iBLtST/Syo7C4MhaM7nJREpig7+KW8Aq1w20tG1Xyv/e7R+hEpEL1Yewxj6iPg/tsT4UgUGzt65zUoIbQnmaTgk7FlVU3ZBObfdi8LaJqiIOH6kQFxzm/JpDZeHT506eANhUPwhX7h9WiNfi6FXQf4ixjVwd3um3WS1Fgldn86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhVmV7Lm65oarIfG1QQ84SoU3AdJF75B7SjXXE2hlB4=;
 b=LpMxrFdd0PfRciqAbQaTYFZdLHIs7yf9vVrxfs+AECz2U/V5jd70BbthhsPrWiDX4YTVB7oy0/bGxvgtLlZ39NWz3p8jevfLQuq1/52ENM6ezweCqUAMoCNmib3RPGyA+mCLY+zVXySocalwFRkssSH49Sk4QlN2fWHu814yYB1SMuotcSb16uCst+c3wHOkQTB/HIbUr01VlAMArwFRYIl1EJ7VrprVxXTBiDVkm5PQqb1MlgcdZtzayCeqc2DRRXV50nQiCyUHG/I6GIKXD4HPW7UL0o9KnRub0h1w5rE/6BVjvri5gMxoH0hMIA3dMKtSgjlBJqqngj9LXvvo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhVmV7Lm65oarIfG1QQ84SoU3AdJF75B7SjXXE2hlB4=;
 b=pmCJXKoAN8UQju7kJwiHRDbW3NWf4QjMyCvoM5XcHdQBNPTCLUBrJjk8gz6QNE7xkyQg/oB8/LCAQNnHVLwXxGZRGWhzdU27b9+pR5zCI9w1JJ0H4d0WHkfEEvQJsiLOiMMXEfgadlt1nn2mJ1tJqLBjOzinsZYIbzTdnNclueR+FOaoktRVP/mk/8KEKioL1XOH4Mpsy4d3m6VhhBdT8nd5iyXvY+JzhyrUBDpkk8IdcxBO+PrPMaF+EjgObphuS8nRkBRSb5PdTcEGYKbFGjt+afWw9NUwBQuVDk1UTbbMQQuh/i0DtvKgm6/jE9uvE7OO2J4rdbplK7RXHHi9yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Thu, 21 May
 2026 13:51:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 13:51:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 21 May 2026 22:50:51 +0900
Subject: [PATCH v6 4/7] gpu: nova-core: refactor SEC2 booter loading into
 BooterFirmware::run()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-nova-unload-v6-4-65f581c812c9@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edd9579-679f-47cb-22dc-08deb74005df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fiX//b+57T8e9JXIjzB/LAWIyRVhsxUhXLFiYnznS4MiO/MKxtnmfKnW6lSWGvkkRYqLgVsvVJCo0CMDUSUnxjD4J3ZL+YUiSwzKqvza8xL29rZRhPbAhflFpCuEJd6aw3sZ30x+NsRcsCZO/kXOv9gK12nfKFX4ceDu15cxxlAjxU1WsG++R9NX3P85AGCzB20vQ5A6mDHeAtJH4Tqq/uK8QfNkZNLRarWFDUXByLMdCoaJqgQzY/h5BwT9aqCeBZHoqpOGWBGzhGzxXbSK4U1qoFNZbJzHibgazC8VjfzNTioeuqfnsIm1nTDetBD9DuaUEilMkgf0w8ho//4Pnmiv+LP7xsGxQJUe9Yqz06Xz5iwJtrjvXfJi5KJ5dYZsZqe4+dWB1CGF09T4SYUnDI/LUktBKgm9wCEsb4VIPc2lwdjkAEk/SnY1fTjrAkYGHWjnsbTIHz30jStDioySJq0OQKx7Ugy1N+PlS+EnjnD9sC/oJDTRquTdONpCx/M9Bt1/cTZzJvPyL5Bv6wJJXxdDuzRYdKtycmzQcvOcx5H2WmJgswcZXU9Kea2mviywphgqE5TaBRqBReX5HbzofRBoaeLOI/GayVeKBNjAJnXqCHpYzuJSJIjXy17N+MFgzEkgU6AJzCu9lOzPC81ESzKNpP21DcTWOKYm9CraM4N8J0wrf+cRWY1Dqn4dMVRf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3g4VG5uQzJYMG5oYXJxSjJPS3NDQ2xPbUN4M3kzN2NUM0RBNVN2ZWQvd1p3?=
 =?utf-8?B?SEhWL1hsanN0d21ZVFQ5K3U0QlpjWGwzbmgzOTgvWXFKdU5pUFJMaDMxUUlw?=
 =?utf-8?B?dTlLRnRXL05tTTVBendmUE5vMmpVS1BvV3VrMTJ5ZTRjaHdtKy9uNHF0RmVr?=
 =?utf-8?B?YWVWLzdFYmxicHpVRVZWNG1Mck0zVStFdzd6dlNrR1Jucm5qTm5sdlJYNm9V?=
 =?utf-8?B?K0VLOVRoR0NyRHc2U2VHb2RjSThFTHhoem1hVXpZMXlDRDU4L3RNNmRpT01F?=
 =?utf-8?B?SkJIazIzcEZCOUdxUmZNMTNaN0dFYVV3Y3p5MWFxRVZrR3hkRXVyQmIrbkU0?=
 =?utf-8?B?U0RRdmIwZ1J3NE9ySWdLMnJxbEV5UlBTUDFSb1pYVHM2UXZudU0xcmsvajZr?=
 =?utf-8?B?eDNrZXc3NGZQR1NjUnVTZnIxT3FaaWJNdkJuOXh2cjRKdnlLSTduNW5ESDJa?=
 =?utf-8?B?eko3SlFCT3NBN0taOW03WTVRL0ZmYVpHMnBGTnZDQ2pHdlZpYmJUYmd2WmlL?=
 =?utf-8?B?dkJEOTRuMFhyY09idXgrWlhnNnhOMkh3ekgzZW9GWlJkR2xVN2lQcHVMbFNs?=
 =?utf-8?B?NE9ERWJxUzJyalFEU3d6ODFpdmlaVzZZazBaQng5SzZWaEJyTDY2cWhHR2Zh?=
 =?utf-8?B?MHEvQ2p2ODdXRTE3a3FOY24vQVVULzRSR0tyVXVLamRnWVhla1R0dDNuUTE4?=
 =?utf-8?B?T1BqeWJkd0NZK1RZcmtuYTd3YThYT1F5Qk9razlrbDFiWlY2Y2ptVDQzeURi?=
 =?utf-8?B?U2NoVGlIQW4vUHZnQ05NRHlDN2xYZFJCc056engvcXRFcHZNMEdVU3U0UWJD?=
 =?utf-8?B?c3ljRGdmay9QbDJpVDEvYmUwZ1B0bWh1WUc2NnRNUFpxQzBObTg3VFBLa0k4?=
 =?utf-8?B?VmZndTd2c3dvOVM4VW1iU2h6YjQ2Tkw0bVRIYU51aFhDcDhHNWVIT0owMVVz?=
 =?utf-8?B?blRMVHZNYzRVM2lyd2cvWTJ3N1V3bmRMMnBCbUZKNXpMcEJwZW9qY3hBc3Ns?=
 =?utf-8?B?WnhtNUJQNWRqWDM4N21Md0pmdjJ5cndoMDJhY0JITnJYOG5Qc0ZOUG54YzMw?=
 =?utf-8?B?NmM2Zk9zQVNwd2c0c2pqNVVmMk01cUpJRWdCTk5TaGVLTy9sU3JVOVZaMEFP?=
 =?utf-8?B?V05jNlEwN2hqTlh2VFhmcW5XazgrRDZHdDhVUkQ0MjF6SHlHbEZReS9RMDNj?=
 =?utf-8?B?R3FOa09mRmFhRG0ycVRHc2w1QlhXTXFNQ1hUZW1RVzF3ZkFoak50aTRIL0Vy?=
 =?utf-8?B?TmlsejA5ZWZBTDE5aDVBRE5aR0kxc1g2Y2ozcFcwQzZZdjlXRTJsWDdXbVpJ?=
 =?utf-8?B?eUk0bXVTdld6bytqNzFLSWJJUGVUZVZYQjgzaTlHSFBIanMxT1R0NUNMMGxE?=
 =?utf-8?B?aU51SUNhR2Z1R2N4Mk9xZGxpTjh0VjJZeDRhY3BvRHE2MkJtUDQyNDQrMDJE?=
 =?utf-8?B?VGUwMXRITnplUUdOd21KU25qZ29tWDVDd29qRzJRME9DTmNkS04yRjdYOVF3?=
 =?utf-8?B?aXB4S05BRTJ0a2lpK1hSQkFiRWJTcUdoV3Y2TTVwRjVIMGtzVlllbWtXMXNU?=
 =?utf-8?B?cDlWc0p2bnJmbTdaTzJqVTJyWXVUcDZxZm1NMmhQeSt5ZkpRaDFIbWo4anN6?=
 =?utf-8?B?eXhkOXpKRjlReC9LMFFBZXdxNDdUVE1KcXk5ZEFJZmRvbnlZYURldGpwVG5S?=
 =?utf-8?B?MTBNeDFIYmt0U2hSRU1oYTh6OTFDaHBMZVlzR0t0ankxcDNNdGhtYVJkVEpQ?=
 =?utf-8?B?N2FiNXBTaHBRNnl2eEh4UVpoZGhublNPZjlrMEcwdVA1NlB0c2tTU05FZFdX?=
 =?utf-8?B?VU1ZZ1ZmWmQxNjNkUWppemxJbGF4VnVCMUhENlVsc0FRcTNIYjR2Z3RUVUo5?=
 =?utf-8?B?dlB3UWsrY09WZC8vQU9FWGQ2alM4Z282TDl0alpuWDRWaEdzakMrbDdGRUda?=
 =?utf-8?B?L05FaXEyb2N0M25yZ0E2SGJpYWR6RHp1K2FkWVZPTFVGNjBVT0hLdWVMWkhQ?=
 =?utf-8?B?cGxWT0VtU01iMUhGd3duUXdsYWM4RHlyaEVEd1ZTQmxnZllUVWtBZFdBd2s4?=
 =?utf-8?B?TDN5YWo1amlkeXA5aEgyZUFqOUlNWWNRbGEwbUdVaXUxc291eHRxZHpvWk9G?=
 =?utf-8?B?cytWUHJsZ3JXalVTd3lHYzR5N0QrSWc1cWk2NmttRFBqM1lja1FBdksxbU1w?=
 =?utf-8?B?M0lLRFZBS1B1eVNpT21vaXo3dUtxcmNDSEpXa0hGNHZKZytUZUpvTW1tLytn?=
 =?utf-8?B?T0FkNXdTaFdNdUErcTlHN0xZbkZKWjZwV3Mzb2tYZWxETytVaTJucFM0OGs3?=
 =?utf-8?B?eXVORGFINzBMZ1pYR2FjNUVEZWZ1NitJQjVnbUhWMDVMdkc2M283WkhOcGti?=
 =?utf-8?Q?5q6KVfiCwYrr9qp2WwBbflyBBxkZad0hrjWEN5030GlNq?=
X-MS-Exchange-AntiSpam-MessageData-1: kbqw53FswRj6Yw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edd9579-679f-47cb-22dc-08deb74005df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:51:13.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYuIRrSOnKBQ6qczhX/8o8hZvBPBk3rW1GNSANRXUQ7StGfa9t5u92OmxNpW4MCK4dCdaTgk0wsz6Zs4LNl+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905

From: John Hubbard <jhubbard@nvidia.com>

Move the SEC2 reset/load/boot sequence into a BooterFirmware::run()
method This is mostly refactoring, with no significant behavior change,
done in preparation for adding an alternative FSP boot path.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs        | 30 ++++++++----------------------
 2 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index de2a4536b532..e45e5dc8d5d2 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 //! Support for loading and patching the `Booter` firmware. `Booter` is a Heavy Secured firmware
 //! running on [`Sec2`], that is used on Turing/Ampere to load the GSP firmware into the GSP falcon
@@ -8,6 +9,7 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     prelude::*,
     transmute::FromBytes, //
 };
@@ -396,6 +398,35 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    /// Load and run the booter firmware on SEC2.
+    ///
+    /// Resets SEC2, loads this firmware image, then boots with the WPR metadata
+    /// address passed via the SEC2 mailboxes.
+    pub(crate) fn run<T>(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &Coherent<T>,
+    ) -> Result {
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(dev, bar, self)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
 }
 
 impl FalconDmaLoadable for BooterFirmware {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c123080148f1..4f654e10259a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -174,15 +174,6 @@ pub(crate) fn boot(
             Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
         }
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
@@ -204,20 +195,15 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(dev, bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
+        BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
             bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
-
-        if mbox0 != 0 {
-            dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
-            return Err(ENODEV);
-        }
+        )?
+        .run(dev, bar, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 

-- 
2.54.0

