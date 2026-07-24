Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E142F718
	for <nova-gpu@lists.linux.dev>; Fri, 24 Jul 2026 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891472; cv=fail; b=I2JFO5LmfXRPtUXlOJCWpGV/+ERsDWRGfCC3752FFNlbX68Dqsp412f2d8t9eFuN+oYSThsyQn1c2GhMEtnhgD4A6tgig2W+eGNCr5AgiZ6bJbHNr6G9aAzZgmxCj2fe8LPpYXK12BLYV7Ry4wFKklCyqZbHzt7mLkNBNaBYyuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891472; c=relaxed/simple;
	bh=2o/NSMqtCp1kNH5p4LIV2TlCmjtzcM5E8exkIgfEzQw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CbGspObiO1g+YJI4ypwxaIq4STIRXrMcTYx5juViJZOpsHGeAYWfU6M5Mc+JbAcUJMk2UYwVZohHLfscPab9ycPQzVzTBU3tNfM7Sk+kP4pm5r/qRmI9X9evMSlq5P7p/cnU+/nQ4/DUI2pTz+Hw8Kc6E09fLk9wpOZSxebJQLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mqOT/3lM; arc=fail smtp.client-ip=52.101.57.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mqOT/3lM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVeun9bAACspP+JERkT4O4nvFp9kYxoRQM41gLETkCDANnmOs4EFpKJXGOfZoN9mSRi6Ez5f0Y7ad6BB5MprQNlmSSr9iSH7YVi0psTeqoPRVah+zZDj2QACZy9EdZ1WHVuyDT2QdhyAjGCKnIwRMPrqlZicLQUWpDY4NOINFZyHYpKNxDj6bdog7jwNKYx5EHAxIUROVozZct0OmCNrWZ8lq2NNJCY6OUXptax3skfVZg+ZFQeMV6m79i1CNX0Y1fyfA/mRqvUsWYSfLwH4AlAIG5nq+ncT6Uek2yemLDLwSJElislRp/Mi+OOhqQNyFf6YQGob8iKOvTe5UvNq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKmH7SiM4DIM2jD6cy3bT+4eKPS1uwJnBWQMQE6LQEs=;
 b=kn7KMDoULhfK+MKb/6JUdGwF7BwFQEX8JQx/El883/9/21J6SV814H63a0CCVpa4ISLVf5+/g3ZZGbrf7TWQ7GWrEpb49tLofUJdUt8ZAa7zweLvrGMxEybT0XUIkEp3jR70ppKNXKGgGBLw1CbbPoMqcfpVG8q4RCcfw+HdxROmOSHB65ETdiO7ImwwSbYW7cI7Y91Xd8ZDjBEeinuGcofGf66ssXmKITr7RIjcd4RMB91M9HukfBXuKfMxzVBF4bG2o9pihvROHF+++H0rmOi8hxprj/AdTasq1BhrIrJFJ8XK38tfVlggGu5Pm7uMRG3aMhyKE68Z3qTyJG5rzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKmH7SiM4DIM2jD6cy3bT+4eKPS1uwJnBWQMQE6LQEs=;
 b=mqOT/3lMokUVZrDjq+hBxoCUEvhTAcQWHblTjJlQKGb/98c3ufXnHwNuf1wF6ewu/HJByYKnV6PJojf3t4hXxFnbhJ0mwb1aumDhAXGpNkEVzonuKLYf/WzoHU/22fip4XnTfCU+320iJB+2Nl0yT+DEYvoE1QXIreJtFLjZE6kI1GgpYGMbSZy/+fGSntoRCVrusr5j9/DiEpzmp/twg/TOJzAMBcjE1D4JhLgidO0TZwU322dXouDIKhmnzo1vC+8cnN9+d69HY03qLkJSF3QM0Gk5zx1YSwE0fkzVm3akY+z2zNrtUIjhohhAhgKlR/FXFEdEPSNst/ApjPgoSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 11:11:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:11:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 24 Jul 2026 20:10:50 +0900
Subject: [PATCH 2/2] gpu: nova-core: falcon: use I/O projection to check
 transfer bounds
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-falcon-dma-projections-v1-2-957028a7c0a7@nvidia.com>
References: <20260724-falcon-dma-projections-v1-0-957028a7c0a7@nvidia.com>
In-Reply-To: <20260724-falcon-dma-projections-v1-0-957028a7c0a7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:370::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: f80cebfd-266d-45d4-eb2f-08dee97441de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iK0cU78zGyLuVFZGIxFEM5RByFYF/5Xjt3rOrI6r0NFrBO3Fhm2MPZfqMJ+rl8gKTW+mBncelMbTg/Pa+4XnAy3NdCqMnJOxjx2q/sHY7eHMCDKICELH8/VQdia1coKwBTKd1uisyO6C3vFGeiS6GEyiUFBaRCQIiQPSgWJkPu1UFXcwMVA1p2RV8LrGG6FYSzaTMFpxF/WRqNRPBna9R2+yJeLXZ85eo4d/3CYZHkg4+cWQKdLMrZK0GG01t3qPgfpuA3jtfiP1oN+6GzQzN1sWF4t8iIkMDDmfjqG+BUSlX2TzahWV/f1IcY0fIt0DlNRilGwbwmF3CeqrKJa7W7k+CbRDLqJ1WbCw7Hl3CS20WON4LFITKabgi0NykmQK9oXn0Zdv2OmonLE3QDMHwm9OVGPkUWiKefEAlElVFcZgoovYCwNJdEaHDlw0QbBOpVVnYtCPtg6BcgyiXsPIUWUkH8e1u0RFlmdTqu/wqHMWm59fBxkjRC2uPHG1LmtWfkBMroS+qFh4OPt47P1aLv4Cz7z2xOVy29pbvlIt/S92NIyrK6p3kdOYYFQSlvxVOrE/h40zdnUOhVJScvPYFrea9KpDz7LnQTm6QA1PFZDLKBBASCjDsruxV6vfFiUZpZDyEEJaId9gCcI0Yg62B3qYjWtwM7aM21XXZcGZJj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWtnOERYZnhSKzJBaUIrTkJ3UW1lMytsTTNZWUVwMjRaaG53SlhGeGdQbWRk?=
 =?utf-8?B?RXVZTnN2QnE0OEF5eTYvVWxKQ05pcC9DdEhONDRmR1FjRExtRFF6cnozc1BH?=
 =?utf-8?B?ZTlyUE9xT0FaaVdsdHJ3QkV2RlJRanlSTHl0V2dvLzAvWGx5SGsrWkdib1BR?=
 =?utf-8?B?YndUWE1lWGNJSlJNREFiR3dOZFZXQVNCZFZ2aDZBNC9ranp4Sm9EWmZUU25m?=
 =?utf-8?B?REZrTmhHemt1anY1SllwMDFuZ0VybnlrTzlYWE5BNE5sYjhZZ2p0ZEtKWkFM?=
 =?utf-8?B?VnhQRUovK3ptRzRKalA5b2tPRnYvbzJZUEo1b3FyRVpVM2RpQ3dFczc2dmMw?=
 =?utf-8?B?MXVWRzVjaHNnbWdneHNpUENHbkd1aUpOeFRacytxVjcvMEY1WkZJaFdTUU1J?=
 =?utf-8?B?L1ZCL2Ixb21xSUZLN1JBa3ZlaEpqWm8wS0lPbnBQcnNkby9BaURGaGF2NlFI?=
 =?utf-8?B?NlB3WkhqTHBvMVQ2S2o5NkI2N2lNN2pUc2ptcEFJb0VNcWNrOWxCOTlhNkVh?=
 =?utf-8?B?S1crN09naUVIWGJMaG8vdFI4T05IMVV0emN5dGI4TzNKcFliZ1JEQVhXRWY2?=
 =?utf-8?B?RmErNEFwdDBLZmswNEk4VVRwN3pBc0NLbmwxRFN6RzRiT1lGR0xJTmU2K3RW?=
 =?utf-8?B?d3g1UnA5WUJsY2xKMFlmdDFQVWNZMnpHRlFGY3pTaWlaK0psc3M4bklVWjVB?=
 =?utf-8?B?NXgxcDNudmNKNlRzM2tlVFZPaGRXbUsyQzBVS0d2a1NtblNiaEtGek5IR1gw?=
 =?utf-8?B?aGZlVktZbTRCeUJURlpsbXpKK056Y1pNU01yMEw5QXByT0FOM1VwYmJmSFF1?=
 =?utf-8?B?WmpmM0JVUUgvSzhyb3VrUE8rMDcxaWFFODNFWkZya2M3aEFhS3FTZEtDSjZr?=
 =?utf-8?B?dUYvSExlYkxITHc4MDc4Y3l2d3FpNmphMUtzUUhVSTZqb25NNmoyV3hQRWcv?=
 =?utf-8?B?MWxtWnVFSWtuS3drTGY4S3gxckZqTnFQUlJJVVN3L1BnV0RxMWN6aG0wTEQy?=
 =?utf-8?B?bmxFZ0NVQk5HU2dheUQycXl5YnAvaTYxVDM1RzhmYTdPaFRZVU9sSnVCQWl3?=
 =?utf-8?B?QUNVeTJBcXlTOXoyeXVzWStWUFltMkFubUpIMjZBK09SMVlsVnpTUzdBaGRz?=
 =?utf-8?B?eHBXZVJkckJ6aldjZ2pqNWtxTVV4cG9EaFJMT3QzQTJpSnpEbXl5R0xIbUdR?=
 =?utf-8?B?clNpWm9JYWx4b3dJRFVtMTRLOG1BNEJOSzREajNXTGVsZFNISUN4T0VzMWJC?=
 =?utf-8?B?UHhWSDJiL1E2cU5mYTdlMFFjeS9kS3ZNaEpGREdDdkx4V1gxeVM4Z0RuS3pu?=
 =?utf-8?B?V2VadjgvdzRRNmNpYU43ZmRFMEg3aFZyNjFwRzR2ZnZhVUFPZUN0bWdkZzMv?=
 =?utf-8?B?Wmp2V1VpSHFwSU1weGNQZ05tekhCVEh6My92VkQwc2lvL0FDN1NWbXg4Q2cr?=
 =?utf-8?B?dHVoSjJQcW9LNXRmbjdLZTJGdHVYMTB0MVdHcFIrTnJQUTRIOFF5SmVDS0RH?=
 =?utf-8?B?bktramdXbXNCZVpzYUVMSGVJemI1Ump6Y0NidUxveWt5MVNlKy9SaFNlNDhY?=
 =?utf-8?B?TW5FaFdldkM2OEcxdXNCYUxmVkJWS25OKzNWQUtSaGVSbGVLSm81OEZtaUFZ?=
 =?utf-8?B?a1VFOUdyYmFNc3hCeFNyTVNmQzhPalcySjAydFJTYVhEblQ1a3lWU3JKR0Ja?=
 =?utf-8?B?S2xQelpBcHMrdkNscnREdWxGSU5pS3lqMERsMlZTS0xYZEYxODM0RzRkZDR5?=
 =?utf-8?B?OXB5Tm5HMVc0NXZhdzZIZEkxblJ3c2RlYUYvZUF5NnZQOC9La3VZTTRVRXVF?=
 =?utf-8?B?SzNnOHNoU0gyREF6Y096dENHdmpjOHdtWFRwSDlVZW9LaFdUTk52cVIxL0dj?=
 =?utf-8?B?SWdqSWJPOHc5NkJPUkd3Y1ZDRWJjMHJDdHU1cmVHeGp3MXQyQzVhOCtBcmEx?=
 =?utf-8?B?U3EzYTR5amFCeUZKOTVtUWc2S0VUR3hrejltQ1ErSzhaTVFiMFlmTkFRaWZh?=
 =?utf-8?B?Sld5elZRMXh6YnhPQXBkQ1MxaXdiU041aGRnM09iZ1QvWklHSnh3REZpV3hY?=
 =?utf-8?B?c3BkSnNORUdDZG1Xc0kwOTR2TjhNUHM3SkJwZWxHVk8rTFh3b3hrTHUxZS9o?=
 =?utf-8?B?YXJHTldrOW1tVDVtK0c1UnZHODk3Z2YzaVpMQmMwTUljUGlxQTBFVTZ5dVBG?=
 =?utf-8?B?Z1BCc01CY2J0OUZZOEdEVWVVRWJwN0RhcmV2ZXo3NDJMUnJ6NWU4Z041Q0tw?=
 =?utf-8?B?aFIwbkF3UHRyM3J3YnBrRkxJZjZVZDBNbmJXeFhiNVNjejJNNm92TzdEQnc4?=
 =?utf-8?B?aFBHQTR0Y1FuSGtKaFhlM2ltakMzUDY3SVRndHdWTVp6d0ZBMTA4TXNJd0VD?=
 =?utf-8?Q?n6tfRInV58QejQ0NM8dEnQ6huzr95PhB7umPUduSwcZe5?=
X-MS-Exchange-AntiSpam-MessageData-1: NpVfCdQ5IOIL4Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80cebfd-266d-45d4-eb2f-08dee97441de
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 11:11:06.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpcrLTH8V7ARHn3Kkt+u86KnLWjAWa2gcp0UMXOIRYDC0CG/9EU2k+S8poh2f8tGpm/RPe8v2lJ+mQnEpnjGaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924

The DMA transfer routine was computing the start of the DMA area by
taking the handle to the beginning of the coherent allocation, and then
adding the transfer's start offset. It then checked manually that the
upper bound was valid.

Convert this to an I/O projection of the same region, which returns
`ERANGE` if the passed range does not fit within the coherent
allocation. This removes the need to perform arithmetic on DMA handles
and to explicitly check for the bounds' validity.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 55 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index cd05985f5ee6..344cb1487295 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -12,6 +12,7 @@
         DmaAddress, //
     },
     io::{
+        io_project,
         poll::read_poll_timeout,
         register::{
             RegisterBase,
@@ -511,20 +512,31 @@ fn dma_wr(
     ) -> Result {
         const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
 
+        // DMA transfers can only be done in units of 256 bytes. Compute how many such transfers we
+        // need to perform.
+        let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
+
         // For IMEM, we want to use the start offset as a virtual address tag for each page, since
         // code addresses in the firmware (and the boot vector) are virtual.
         //
-        // For DMEM we can fold the start offset into the DMA handle.
+        // For DMEM, the start offset is folded into the DMA address.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
-                (load_offsets.src_start, dma_obj.dma_handle())
-            }
-            FalconMem::Dmem => (
-                0,
-                dma_obj.dma_handle() + DmaAddress::from(load_offsets.src_start),
-            ),
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0),
+            FalconMem::Dmem => (0, usize::from_safe_cast(load_offsets.src_start)),
         };
-        if dma_start % DmaAddress::from(DMA_LEN) > 0 {
+
+        let dma_handle = {
+            // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
+            let dma_end = num_transfers
+                .checked_mul(DMA_LEN)
+                .and_then(|size| size.checked_add(load_offsets.src_start))
+                .map(usize::from_safe_cast)
+                .ok_or(EOVERFLOW)?;
+
+            io_project!(dma_obj, [try: dma_start..dma_end]).dma_handle()
+        };
+
+        if dma_handle % DmaAddress::from(DMA_LEN) > 0 {
             dev_err!(
                 self.dev,
                 "DMA transfer start addresses must be a multiple of {}\n",
@@ -533,27 +545,6 @@ fn dma_wr(
             return Err(EINVAL);
         }
 
-        // DMA transfers can only be done in units of 256 bytes. Compute how many such transfers we
-        // need to perform.
-        let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
-
-        // Check that the area we are about to transfer is within the bounds of the DMA object.
-        // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
-        match num_transfers
-            .checked_mul(DMA_LEN)
-            .and_then(|size| size.checked_add(load_offsets.src_start))
-        {
-            None => {
-                dev_err!(self.dev, "DMA transfer length overflow\n");
-                return Err(EOVERFLOW);
-            }
-            Some(upper_bound) if usize::from_safe_cast(upper_bound) > dma_obj.size() => {
-                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object\n");
-                return Err(EINVAL);
-            }
-            Some(_) => (),
-        };
-
         // Set up the base source DMA address.
 
         self.bar.write(
@@ -561,12 +552,12 @@ fn dma_wr(
             regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed().with_base(
                 // CAST: `as u32` is used on purpose since we do want to strip the upper bits,
                 // which will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
-                (dma_start >> 8) as u32,
+                (dma_handle >> 8) as u32,
             ),
         );
         self.bar.write(
             WithBase::of::<E>(),
-            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_start >> 40)?,
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(dma_handle >> 40)?,
         );
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()

-- 
2.55.0

