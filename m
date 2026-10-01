Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFA537F8B6
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 00:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816189; cv=fail; b=UxnXAuZwTB/hnABZi4EYGk/FTDJgMrSxwMfkceq0yFupUpxZpVAtRXLZHJIHCQQSdvXAd0O2qml8mUrK4ITabP0BT93fPYqLlsGWuZEFs4tM+yfHoz4AUq7UbDPGFunR6SYVRfDV1YWxhiIjSpQItoWK49chNIUu9DZb5dIxQiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816189; c=relaxed/simple;
	bh=EMMLhoG6dL3yMPdIABj3IVdd6FfcPVZgW+MIbzwjMHI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TfIUuJdrv1RPgiGH84bBY1BMLHhIdQvA+yDRJjlRMCa1NVG8l8u8XXdRJgiU9O1papYf9pJa0WmBI5ZMRLvMJjmbVp1IZ8VtigCMfcFi0SejzEPsvoSM4QoJfXBs+7Ru+RmnyjO4XPIdbpNHmLnf6P+YDzC8Yrc3HwTkaAra0tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GcwJGp6U; arc=fail smtp.client-ip=52.101.53.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GcwJGp6U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYNpak8qOHPYBs0eY4PXCxGL9bRhyyNiFMX/uCraOZm0xleoMhcY6l/k7MyMVJZYo0oVRlg5dF/T0vv8I3qfk/6GWMIQ7t6tOFvmVgYCTBqQr4Yp6MpM/3x589k6zAfbG3Y6LwyZQUNMf98UVYx4LeXL1PG/6XCO1n57iDz4clJEfMvPtV1osLrZ0BBV8a5ckfkhEEJmtJiylBG1Yzdi4s6VPGi+qvs4ZzZzsJD/Ec0aEAj7BiuxTQrEIqhaOSpjPbdiF9dpl49LDim7YJ+eQAw7PuUqM/NjG7GqCei8YZh0V6O9XiLUdcjeAndOaj/8uvsJpq2xZ2Hz0fBcfQHI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=520SbP4I7wCQg9h6iw3BSxK6Pe5DksoWs6tXup2uQ9k=;
 b=Ppo+xsApjSnDFRJDxXZOhAHaoJVg63nfNuOCmdJjLQSLhz4zFByAz3sGgFkRhFNzolGxez5UIzV7+sFnkvOpZ3saGlCEmt+dLKPlBALoQfRzBd9hXjU293ChCFXl2To9U14k449j2S4F0X3kUBccB7L7ytX8kCeRXACL8s89YXYuwZFhTjI5wzuAUxfVBFKVMykcD59SuZH9E3ep3VhMNcjbrKxU5uRkaZaYBvxeBwSL3zn0+TfrJ7v3KAqN3B+Wb+Sp+SWjlUOfcqrckU3zPMy5RXe17fQORaBGJqfbFqam3PSqmdzPYI82vy+UgQm+j728MuxfUFG20sR1X93Z6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=520SbP4I7wCQg9h6iw3BSxK6Pe5DksoWs6tXup2uQ9k=;
 b=GcwJGp6UQpni5mU772S3IU5Fcg4nHRn56mMF8Y1J6xWBmbNLWEyVDHv2dnllJXZo3VHESzCLLsdvtCLXkqJVs94jRXFzAMfoq+AxRxJmKAArd4h7eeSEsNjdv0y48o0+4o6g8UNyvwQ76qa88dkowgNFaBxnF3OCVzhLONh5IZWqIGl5X1CQGpVLi4nOLoA4d06FSpvi1hAdKMJUtFOM1VTRN2/W5gEMgo+1iVA787sf5wqankI251LQZEXJ2vvbfI8JyGtK4tsh1NuujUQV/VFx8fAc0j4MfK6NCoPrA4v1dEyYPLfvBQ6Y8krbSOQmGkR4vbCBPJTuN2C+/9A5Jw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by CH1PPF931B95D07.namprd12.prod.outlook.com (2603:10b6:61f:fc00::619) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 1 Oct
 2026 00:56:23 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 00:56:23 +0000
From: Alistair Popple <apopple@nvidia.com>
To: nova-gpu <nova-gpu@lists.linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH] gpu: nova-core: Use bar1_resource_index() in NovaCoreApi::bar1_size()
Date: Thu,  1 Oct 2026 10:56:15 +1000
Message-ID: <20261001005615.77130-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0083.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:247::19) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|CH1PPF931B95D07:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9390e2-62da-4d0c-c7a1-08df1f56d04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|10067099003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3/x6Mck+V3hx1RT8sryuNpSK3lh0/+Vdkxc/Pfyo+dWcIG8peaFkir4klelz1c0oBaO7migSvE1Oa0ibDI/YWN3w199bCu9dFnfEpDFNDZHaz6kOUQYWk8ZVE9ZLPopk6UPjL8p3kgqccJEFgmTq01P4Mll//F3/PnTNMgLqRiWyL6FVLjOlwnEjVXc51yw1Ug9cJTjo/GLvbDL+BQf+Y/2vtokvVq9CuURnLKpVTwT/ITVz6CE60pHqomr0sy8yRKT9JYuRJEkDzVVTomTj4e8uVfkeaZxDygECS1pRqCsawV+ZPnbszd09iBO6DpaMpInj72PXRDtyCbA9mmJAmFZGPzEHjgOB9SirPSDQPMFag0JIVdZo0Ldajwe/s5T6K4j7T4IMkTPQtSspQ96sTg/BwX53gr21hlVkrBCBysxww0WGdl+XfOURzdipQ0RCbAgJ3Ivdf2ku6JhXPhoDB1Wu4B08SV1dssiSOXlC4dLztyE5lgETxpNfhTkNxcOo8QophxfV3JheU1XaQ8EEJoXJ0zJyjqb+hkC5NNOAMG9/doYpOUFtRcOlMZ/15YD6rdL5CAQcTuFZxZp4qvWO5b8mBHjOvc3KKzRCeOWuGDCV1CWizTnt80sBsHIu5Milatm5Ubv5N5Aa4p0fbBVhgwfJ1KOlet7deBTiRbDY5eA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(10067099003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zW2WgY7crMOyzsxOGK7ARwNGCRgf2iSwEwP6AR0vk3kB6M+Ds0I3UZgefPuk?=
 =?us-ascii?Q?7fpVX4UIvjNuYexO3SJym2eB7EOubOTzSGEpim2def84z9dZSYplZHmKbjdV?=
 =?us-ascii?Q?l4dZ8++AkalegWhEt5L1CSC2IlcdoNDGh8gd4gKUeXeaQQTfmO4HU7kEMGal?=
 =?us-ascii?Q?n/iOkWR8IojAv9qnWM3qN7eZFYnEompwccYYLuKBjSXwuQOPG88qUw/a6pkC?=
 =?us-ascii?Q?C5TusdZePcAwOSbH7w28RHI3u8fMtWZDwQpSI8bUyaw0xeMJLkJ+jG2CvOpL?=
 =?us-ascii?Q?b9jAG/xLLe3HLbv3OykS8hrj5MNZMo+QTqaC8exwibHNc5hiE7zGM9LqQQzb?=
 =?us-ascii?Q?sbBZmKwTiOZ3/qB29+untvSbkc3jXqenBMuHRObaaYrlZ6JkuiPGMgU8sQnq?=
 =?us-ascii?Q?38TKZtDTFUxibPoSta9+DCBq0KBusOroJrF5+X7B/oQr5MJLLJgBr2J8glcF?=
 =?us-ascii?Q?Dt2aJ9tAr8PCUUFphs7weZK2dpQ7zctsaqP/9QVBdak+fdfb1kPxNc8WlUtd?=
 =?us-ascii?Q?YRKNEy2dKQST0E0EEgMFYbsDEh4TRDA1LTk5l9hQ9DWVoftnwkkfJv0eMUYi?=
 =?us-ascii?Q?DbY5j/osoEOvvIOMhLTwgBJ1cNPreke6x1L63+ZI6bviUyCto6Z/loADR/tt?=
 =?us-ascii?Q?gNgDPi2wWvYiqZ5kkjC2T7ylzkm/9lMQccP7RKFM0Egy62FznW4/09K1M7I9?=
 =?us-ascii?Q?aISJlpwnV4WzbTqP8VCliW3Dd/roWQ5OE3VmbAS/EWvKi8lOxXhQVI6bhekv?=
 =?us-ascii?Q?anMifQkjeqMkEsboUJC+uZDdfc+8qyTfQlxDkWQplZ7DI2SsWegecai/4WSX?=
 =?us-ascii?Q?p83woVB5XYVxahlp7wLdelRtjQRwg2P3Q6hXB6JSAbGwzY5/gDHJXogkvr1j?=
 =?us-ascii?Q?I34ybeCTnai1SnriPp0goHBLc6pD3Oxttgx9VK0u4IWbJsMNDKUHX54MWpmC?=
 =?us-ascii?Q?N9uNxjqTSAZlmwPrEQPfEmH4HYuTjUtqxhiZK0s6bQd0C4sDD7ZKgrD3lMEd?=
 =?us-ascii?Q?1bH2VvNOdoAezDkjvsJBeRZzuCLogbf5fmy8dEevCJm4Hkxy2V7Qv7yGdC7P?=
 =?us-ascii?Q?WYv+5kg0l5qrKP8tINpXeI42jRP/pyEO/sqetLv4JnrG3XDCtnjjcs6u3cqu?=
 =?us-ascii?Q?WF+ancIVPAySdzxOos6oP53YMhyJdFUhAlZIqOQ7hQx1P6dBsGt0/MWeZqng?=
 =?us-ascii?Q?oOVlOpFPEw11dE4x84Ld5dK1CmvW4fC3LuyjTgUl3s95z0gxNVD/939++o68?=
 =?us-ascii?Q?jqIZQ4U9KWgQZUnJ6JqJXY6xY2jKAmXpS3vsFckEzf7+JsoZflEEy8DJKQu0?=
 =?us-ascii?Q?DVjJVcFSA1oe3wYiDOBYOJ6Vl9RrxBKgA2oDCSoNTHJH1rev7qGFZK1igJVF?=
 =?us-ascii?Q?Rn6fO8guqR1cLfzLRUH5nzoANbXn5J9cPDZrR631pnBwRL+nhUCbY2x8qsfh?=
 =?us-ascii?Q?B6ERa8c8SNthVRGIfx9+ZJxvw0KXjZ/pKN4LyLgGuidYKAefDnxX2NygY40J?=
 =?us-ascii?Q?50/GzUx51ho1boxNyU4PRIsX0QJPeZbiNU9+BkI+1cKvmoVvongRucMrmSF5?=
 =?us-ascii?Q?QMcl8KEBcTFjlwEVy7J7kfG1K5GxmU252HEnSiM2LxN7WrJR+dqS+tfi/QJK?=
 =?us-ascii?Q?pti3+YeevxGnsn7ng1HcIJazG9EKynnfeqOBgY9jMgcmz6uXx6bzmCnWh/Oh?=
 =?us-ascii?Q?z8lQymhB3Fl/SUMiP94jHSvvzuF/JOQrDoSOAEMJwmVt6z2O8SE5ZywWQxUH?=
 =?us-ascii?Q?0BStT4ONxg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9390e2-62da-4d0c-c7a1-08df1f56d04c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 00:56:23.4562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 856azkCMl+F4lKpMTp3KdFCi25kfbDeZljpREHj5+Cv0P+tpudmsyD+IotjIODpQbSuA5WLnwSTxyWtdtF21+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07

bar1_size() reports the length of PCI resource 1 as the size of BAR1.
That is only correct when BAR0 is a 32-bit BAR. On Blackwell, and on some
Ampere GA100 and Hopper SKUs, BAR0 is 64-bit and takes resource slots 0
and 1, pushing BAR1 to slot 2. Slot 1 is then the upper half of BAR0
rather than a BAR of its own, so NOVA_GETPARAM_VRAM_BAR_SIZE reports the
wrong size on those GPUs.

Probe handles this with the new bar1_resource_index(), which it uses to
map BAR1, so use the same lookup here.

Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter")
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Danilo,

Not sure how you want to take this, you could either take it as a
standalone patch or fold it into my series as the pre-requisite change
that introduced bar1_resource_index() 159427b21352 ("gpu: nova-core: mm:
Add BAR1 user interface") comes before my series in drm-rust-next.

 - Alistair
---
 drivers/gpu/nova-core/api.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
index f02c6c7c7e51..cc1d936b002c 100644
--- a/drivers/gpu/nova-core/api.rs
+++ b/drivers/gpu/nova-core/api.rs
@@ -44,7 +44,9 @@ pub fn spec(&self) -> &Spec {
     /// Returns the size of the PCIe BAR used for accessing VRAM, typically
     /// BAR1.
     pub fn bar1_size(&self) -> Result<u64> {
-        self.pdev.resource_len(1)
+        let bar1 = crate::driver::bar1_resource_index(self.pdev)?;
+
+        self.pdev.resource_len(bar1)
     }
 }
 
-- 
2.54.0

