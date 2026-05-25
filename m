Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19D38657D
	for <nova-gpu@lists.linux.dev>; Mon, 25 May 2026 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717475; cv=fail; b=BWViM2KlfwJ/LPyPISoll47w9OsGRoHZVoAEBYPjYhRqLDPHGao9xBKxujpQ1b83U704yLqLZjhiZMFfERnm0Q02tk1pZ7AlEC3nN+GwL4heiN/dUtOQ/9JLIFn2kQHx5u+o4LPd8MXA1dM9tpm958gzPvxjzozu+c/QAgmz9P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717475; c=relaxed/simple;
	bh=wlHLBYNSyiAvFwNZH0m6n8tzikHzM0UAI/OmkmzOOSQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jRestqFb8iwCnpqk7qXpKynS2tYSSZrnPp5NM7R1KpDEB+9+neQIG55QUxHh0+vTHxy/Y7/UZnvxNSaAVV7xHIAklmSrLQKcH6o/wB3HNQwyB2HgV0T5tIw3PonyNBXeM/VRGaf84x+j/TA8ZygG6HrcDXDzPTR0vNYLWrP2gkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cx6K6YPs; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cx6K6YPs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSTifN7QBo6d4IiXDFNRtrc7RquAPqPqwGfDf3IjRm5qc+BLs9Tdu9UyTou1421ufyEqlQ6MiwmhNhmn5gtLkodUkiSFs4xQ3UM11EWM+6M+6NLC6JV3Z9fO6oa+w6U72G3/WRfWc/t3dGbz3jpY6cZ0kRPwLyAZr8nd4adilnKgN6RxeKy7idHqe3z2XoRcYe8cQg4+7Bec418gzcduS1bDHMBg384o5sHhVOIyb+tcr0rDQIypCm8jmOug9zIlBwweW+UguVJm2qZbWt2NUr1fTv5egI+oBWZwYA2FqLABDyj+6eht0KrnRbumu9shkfKBVopAy+8gcWo4PQ5HYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Q1sfgtdUMPFVMl/iuiRv5Jebs4g10qheWGIkAjARB8=;
 b=MlFhCUMT+Xst6ZDlhCoCkQvBYHovz927BvFah/OfMxv999TfDJ5KF4cHq4+hG9ucmMASX/yXpkid1jqWLySCZxEKv0VILa6NwJAiunWHoAZNA0qecWcU+8VYUuhroLDcz2VKgoH1v4JK8NsbwWjJtpozsB2aIc0fb+wIdKLLbEUZfpFkroOi73qt7KwE9FvqttnwnO6FBQ6hQDnqipfuV1Do3aI/ImVJtUiMLwidF6Nfc3lKo/zCUn5goxEeTV5tXvlcdxbBZJMzhvPFnvESTwOiQP5xV4TNeDFKaevx9pIbGWUyCex6NX3JJXDlpW2im9B538QlmQSPgTo5T/BSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q1sfgtdUMPFVMl/iuiRv5Jebs4g10qheWGIkAjARB8=;
 b=cx6K6YPsb6a8OFfOqd/9xdFeN6UyvMVwvKID0/gN1jE/8T2ZAMmJwl4H006JPCIA9RxRIYmnDP9sR51ubMxtUJI7H4DdhVrSnAjc25TaA4YavfoCJHASrKied99Z8xYPRSsNRMz2Q7jFfOmE+kitTL8RNg6yFUnxYrGPSuwHqz6BnDd+X9QyMs+/zs8J15BRiHk9da9EBT7/6lxdJIIPZBRZiW9AutH0NljE8fHwTVB2gjwMAeQnZkN5CX72Vzh5hQjIhVNeT/ldusCvae4BQw55l/3ZT7NgGBdoAhaL90kMH+XmmBJcAD8R2CSItu8ZMPBziXuyFQLrZcXN+rX4Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 13:57:50 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:57:50 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 25 May 2026 22:57:20 +0900
Subject: [PATCH v5 02/22] gpu: nova-core: vbios: use checked arithmetic for
 bios image range end
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-fix-vbios-v5-2-e5e455251537@nvidia.com>
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
In-Reply-To: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 9997154a-467c-4183-e428-08deba659bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qnIvDlVjdU/G2KK8MC9JrkjkQKANzN6iPuLHzCybsnFs6HWXSxUJSa579jydnqMkKETba74ZZ4gTgsjCwibCzuFLwAVRB7c1wqrO78XPjghwFanZKn6EuX7EFUQYx214BPA6ORH+1luscPSGtEQ66AWkXlWGsioSSg1Wgh/85JgovP1gY12nrM6DXrcAGOuKNnTCFLae+CNxHlF4itdW22DwVoXJnUGMWzrJGXZhQIu3Krf+m/HuWVW8Ej2C9qaN7tnGT4oY7AL9yHIBVzvaXLpUHrzLsmwY42B5VtqubfAKHBar53/3uVTKGu+c96ntbHYIydiKRdY6i+1yDCqA/LHSlf3UroJSUS41Pg1GN6EtRU1PCDd/ynxsL2XZW13nrXzb8MmmPgIuh++a4zI40SfsJRVBZC/s7WD7/iMjjF1xwVHVPUnF+/04kGRmZOc/hwaDsxXP0wGuIXewgJ7EDeO2D3RllRCuDRdYwCEMiwZw5O14UCaUx5sZ5aPqD018bRCXPQLF/EYe0TQDb99+Fv9qOpvATfkVAHDRG4qO3YOJGtlazGlPyFiTMKMLHQvJ4gSQHRWew3MAMb05gEgedjToagYDpKrvC+bbLWNxz8LfLOSIugk5INzN12p+EUO/1rFJPLg0MjT5p16D0iac7nGvpN+KPNAcEsS2nG7aURYkHY93MWHbi7p8DAcEU4bz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRua3RBQ25HamJrQzUxWmxHZGx0SU9BdWYyRW5rNlZLcXdsK1g4RGtCTXZ2?=
 =?utf-8?B?dE5vYkxDdXBvZ3lnUnhSTlhVTy8vTklOMkZrcjR1dFo0amxkUmNqaUptaERW?=
 =?utf-8?B?anYxUU5sOVNDTzJHYmRnMUFWL05ySzJMNmFaY0FIaGtLT1hTQUJwWG1PdGtO?=
 =?utf-8?B?QVd5U05GZGFqaXJ3d1JkNDExZXFEOGJPdVFmdjN3YlRUOHk2QlFIQmJvM2d2?=
 =?utf-8?B?MEo0RHJySGlKUXVCQzA2aEovcy84MGZOWm5SeTEwSStma29lOGNvYjY2eGJJ?=
 =?utf-8?B?Uk9rWjB0NFRXbFJ2aHJES3hhWElhTi9ONjdWYzRXYUJZMUVtRERDLzU0NlJU?=
 =?utf-8?B?dUdVbkhaNzZtajV2ZEl2RzRubm5BM0wxUkxCR0g4Z2dpNkV0N09vUUwwVVp3?=
 =?utf-8?B?cHhIb1ZYQUN1N2NOek1jODMyd21neFlmZzB1UVZjSnAxQi9ld1Ftcko4REpL?=
 =?utf-8?B?Wi84aERjOVlId0dKMTBySzVEeHFhVnFVZ21QTGVVbGFzNEFtZVQ5VkpDbncr?=
 =?utf-8?B?NU1xcldINlp0ZkROU0NEdDZ6VFJCSTBLdUc4SS9Rc2Z2NXZqR0pBTWNuU0Vx?=
 =?utf-8?B?NlFSZGxjVmcrZ1lnbWJzTWhiRlZJMUVqeDduZ0c5aWllS3A3RWw5ZU5GUXNM?=
 =?utf-8?B?di9aZG1TM1dSUGhESTZpMjIzSFRGcDNHWTZ5R0Z5aEJ0TURBdGxXRUZ6WTZl?=
 =?utf-8?B?d3hJLzlvVFE3aVlKV3p4OHdWNjN5a0ZmQUNCVVdmYWE2TnJxSGovK1BaU2RR?=
 =?utf-8?B?VzZCcEJzSXBXQWRRanpiZmNiOHhWV09JUkMydVM5V0p1TE9kYndFWHA4VnVi?=
 =?utf-8?B?aElCRVIwSkp4YzhHUERRbkdiMzIreklOK2pVTUR2TUpYYVJVeUpEQWgyOU00?=
 =?utf-8?B?b2grSUpzdFJkQ1lWUUJuclJycUlWVGNEVHpZOVVUTDU2bUxlK05qUjFmNDJt?=
 =?utf-8?B?Q0FCSFQ5NWMyekoxcEthNTJaUmd2RGZKZzRyL0NnYkZzVkIzOEpKOHZSd0ZV?=
 =?utf-8?B?dlQ2aFJyK1crRjJwMVhnSDRkUnYzN29IRjZBSnlYN3ZydDd6TnNYUjdTeG5v?=
 =?utf-8?B?WXNSSmFERDYxSk0vQzRwMU8rdGZ5QjZIQUk5NmJNVGxZN3hNYVZnTVU0bEMy?=
 =?utf-8?B?SkJHVlp3RlZYNDJLREFnTm1hM21tSENhd1JrRjBCWVB1MWpXcFNkUWRpSnBY?=
 =?utf-8?B?YTJiVnZaOWNHcjNvQUEwNUhnSW9PdHc2a3lhRkkrVVBaWjducUFuZjJWbVdJ?=
 =?utf-8?B?Tkh2dk9oUE9PMFhvZHlhUk5waWNtemhOT05nMjRNZnBqcjMrQ2xKTk9Fc2Fk?=
 =?utf-8?B?OHBKWFVrSEJjMVVINU9YMVYwOXp4TmVUMnRoQU5ONE0zMFFZOVJ6aUtDQzh2?=
 =?utf-8?B?d1JXazZGZUs2enBZVWJwV0RIcE96NGFQTXJkb0cxNVR6TGtYc0N0WFp6WWpG?=
 =?utf-8?B?ZU9ZVHlBTzU5ekxEbGg2aGJPejVobEpZVktVbWcrcmdIMS8ya2tocGplR01O?=
 =?utf-8?B?elkyU1hzWDUzYU1JOVBhakhHVm5LVGNZR2tkbGdlRmEva0FXdUZIOFBtaUJh?=
 =?utf-8?B?OFRKUWJyQU5WU3RkSVNqUUg1aSsrODlSUlY0d1FvbVhSMDR3UUtFbTZWeTJQ?=
 =?utf-8?B?TDYwUkl1Unl1NlphdXNrVlI4RStWWTdFSXJGOVVsK2hOUjMzS0luaElSczVN?=
 =?utf-8?B?YktCcDBpcWdQWUZHSlk4TllIVXR6V2sxbVIrSEYvN1hKaHZ0cXB3S201Z1JF?=
 =?utf-8?B?QkVOcnBqbnU3ZUZPQTFGVnJvSzl1RXlaa1lqanBDV2R3c3UrYUNETTlBbXBH?=
 =?utf-8?B?Y1NuTGlvNVhCWjQ1MEhnV2RuLzU2ZUVSQ3FVTzVNTXRmdGtFbFpURldVLzA1?=
 =?utf-8?B?dW1YcDFXemVocWJOVDlpSjByRXJOdXlLUDNrZjhiY0J3RzF1WUZrdFhNR2ZQ?=
 =?utf-8?B?V3lJQU1kL3R3cVZvQTJ0N0IrV1JUbEZ5dlFTNkJLSVhlZkMyKytrQ1pKVVM1?=
 =?utf-8?B?b0ROZkFGQWpyYjR0SG0yY0V4R09ZeE9vUHEwcG1UdDZkazV3MTY3alZIbG5v?=
 =?utf-8?B?VEFoVTZwL3F5TmNySmQrWVZxeHJWelhtMkVaRk96aHNFZXNoaFhVK0NpbXZm?=
 =?utf-8?B?N0h1NmsxVXJyMWtPY1dOTVJLblgxYmwrSGZMSWszTGVEUlExTzU4UFBDdjlF?=
 =?utf-8?B?QmMrZVFxeUxmZ1QvUDlzckNtZ3p4NW10dVNNTVArVWY4UGJmaytuVmZWelYy?=
 =?utf-8?B?TWo1YVNiUEZCckprdHdsbWVscHVCRFd1VTNBVklBSElid0VhWVUxM1RqSzRv?=
 =?utf-8?B?Rzd3ZW00eVVjcnBCQm5oRU9WK2RGenpnMHd5OVZya0Q1Y0R2S2RYTklWd3ZN?=
 =?utf-8?Q?5PSlz8EjolLWyp5U8wHksseYklyt7yuOyjC/JKmHtDAkm?=
X-MS-Exchange-AntiSpam-MessageData-1: eWXmNVh7lJc9mw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9997154a-467c-4183-e428-08deba659bee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:57:50.5263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wao2TtaciytKaGIK+q/5e+K9/tpaA0HBVYydb9WPglmR8CwmyZpOcu4T8Gi+hWPU48l5N5ewe0EPsWWU3MKruQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500

`read_bios_image_at_offset` is called with a length from the VBIOS
header, so we should be more defensive here and use checked arithmetic.

Fixes: 6fda04e7f0cd ("gpu: nova-core: vbios: Add base support for VBIOS construction and iteration")
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 7bec81a37340..180928433766 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -238,8 +238,8 @@ fn read_bios_image_at_offset(
         len: usize,
         context: &str,
     ) -> Result<BiosImage> {
-        let data_len = self.data.len();
-        if offset + len > data_len {
+        let end = offset.checked_add(len).ok_or(EINVAL)?;
+        if end > self.data.len() {
             self.read_more_at_offset(offset, len).inspect_err(|e| {
                 dev_err!(
                     self.dev,
@@ -250,7 +250,7 @@ fn read_bios_image_at_offset(
             })?;
         }
 
-        BiosImage::new(self.dev, &self.data[offset..offset + len]).inspect_err(|err| {
+        BiosImage::new(self.dev, &self.data[offset..end]).inspect_err(|err| {
             dev_err!(
                 self.dev,
                 "Failed to {} at offset {:#x}: {:?}\n",

-- 
2.54.0

