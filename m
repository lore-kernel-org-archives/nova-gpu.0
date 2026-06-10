Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F271165F1A
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115372; cv=fail; b=dRZJrWMOs4sjNP2VLL/9ssW8E9CcSnvetCjw91aRJL+dJK4FpqxtC/gpOnWj6AVRI4lMzoUUNEcNT4Bs435yu/oH5j9radScYAj95IEh9qyRBlp3kKOa9xHBj3fCM2c6zNrjckXVO5L/g4K3xWMEtaLiOf0LBkyjh8sgBtq0EYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115372; c=relaxed/simple;
	bh=21XToVmoyQ5NUMbWETiuVOZpGcxlsGLoq8tUnx8xzR0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OQvvFaxZ9FPayFC1OTAOPbjAyVx8V8CGH6cS7vmGWCDf8g+Ty73/EiXWIQO2xMbZb1dy6rGJiomeauT6V+2duiLytKHFM1FKCdXccWD/1AzlGK9dZwKNr5dc73j1ubpPBezD061ZCs/j3cuLmHBtG2Jk7jozGCy9xZIMk/IVDSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qIWuCd6v; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qIWuCd6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnEyhpbI/LTwOayD9x9E00KSKXua0TlPUcqN4o5SuVptD1SkN8R/RBUz0fcBaW9Eo/Z+756eNWkJp3BWDgQk9wynzg4FSyq8dE2dPQOCnNyeNfRlmF76wAAFr6jtCFPt6XorcU1RaoZ5BOJSxhshHlHCEIhK47qSCwlbe6vokkuwmag8sIz2e0QYXBDhmR+0R/FwIIzKMt+XgVKUuqXNICD5fs7cTGXlW1I1ZHvDr6h5/znHg8rEIl0OEgBKpiLGpCwxzUeSIBPSq4kHtkXZ/gjDchtL8gW16TQsm+2kXq/X/f3POzZN4ICO3ldv8JevGju6l0s1mIxOzrvayLz6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ro/TVo+ifDi+9OzlQr4qLWv4cu2OxfERAW2ScdQBpTE=;
 b=U34vme585+ocECaeshsgO8AYRzNpepCHpGFBOubdQbKhz939ZXgop5vNjx/91ECRdeNMek3ctQaEsskueROY2r/UY4HPT9BZmEtaY0xbCVIT9hs68V7RX8YhoPQsLE5j/3nriCnv74i4rIFBO3WQ5kFJm+2648JGm2iFpA2OLACjS99yaNYyce0Pjj9SY2vLptrK3VqZlIftntI5YATwZa0wZy2ninmgOYmW3BEsICjhZkOOl0JLwM+swY5DjjqjMtrGj7A/JY6qB/LxpQPAq7W2uWVu9JlHxmZ1dJa/S5/sw7YD08gzi1RWNYlvL+Ul+AAI7LW+uP6IgP3Aylg3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ro/TVo+ifDi+9OzlQr4qLWv4cu2OxfERAW2ScdQBpTE=;
 b=qIWuCd6vAKJ+BW4n2sq/Z1lhY0j6fezFs/RSLjpjyFQRbtR2dmQBt7BeZ6BW+IYK2CpIURo2CmeLy/rOYmJivXAxXfT5kSF0h/LjCU3tZFE3VM28ULI3Po80WzGP8IYzokcSjHoJS2zgvcR2ZyWWvvOvJu/jxELJwMZSitVxgT2PKG6rZDyMKiFbOukzuYuoFYrOxnloPSoh8pIamTetPJMPqMnWcR9LgKd/3HVmZnYXIsU0YVgKu6D/DeODXl3UOa6tchrWCwEzARLGx3KGrWGS52n10dTCDxGWGrM2h448bKf3+KFjoG9UP5KeC2GXJmcwd39lNMOP/P+bGggrFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.14; Wed, 10 Jun 2026 18:16:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 18:16:05 +0000
Message-ID: <00492e63-a3f4-4ae1-8b95-192e2d651956@nvidia.com>
Date: Wed, 10 Jun 2026 11:16:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Transition Nova Core to TLV firmware images
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 nova-gpu@lists.linux.dev, Eliot Courtney <ecourtney@nvidia.com>,
 zhiw@nvidia.com
References: <20260610174929.744477-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260610174929.744477-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5853bc-7dfd-4119-f6ae-08dec71c564e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qbVKLqduEJ4Y3qW7RSdxMzHqCXGyPa7KrVyUg9qq7xxbcgKhDJPeiJZ7+y8f/DKDIPa2xXdSdY/NeAp7kXHMDK5xDwUdmlr1wZoolLiifiRKmifjRoJ/8AVZh4uGfEI8Bjwscpqd4RzL2xyTMZooVY2Q88cOZoU2xkq6Jqze7RfSq4TtIjTj9zq0KBWHjbgWoXk/pTFZw5lWv0riTcjoKNzPFVEQGHMmkizrW1nKiDFldOtVAUIjvhyjQDUh22l8ZH6eWZcKt4nylNR2i1i4kNS8bOcQ02fnOAuhq/9lVJDvqBhSwp4T3wjUaV3supQ+4c8aP0CC1xOzDbbgSgdpdZcZjXJb0VSJ5FNTCtajRUNeAHyth196FYzdiMvJS+8qd0JlPUHM7j7+xeo034LGXkXRoiLMHM2F3ndI8/hXN53zuLL1OpOQ4jH8Lo3Qo0eSAFKJ1fl5X5noCPHA1hcKuo64wNLmHcO8F+dTg5k4BZIcrwBqGhVqajN7Q5IbirsYTNIFGsdjHI6hdURlpITsWmAiHJMJ5NzQsnmmrTQZzKT4ZFIMZ8ik7Uj8fkQT2v9Mxfe2djvrJB1t7dlPbL27JLidefbc8V6D6VXRwNxhCh9gbFEy0PJ1/e06DGqogHYJpeqCaRfi1laIAeJgvQJLBrTiQOwlDh1WaXiQ99dcG0TlCAz1oThitMsdHR7EqyiZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1BTTWFsWGdHN0t4Ui9kZ2xDYUNNcmNEU3grRFJKQjZGL2sxM0ZBc3p6Zjdv?=
 =?utf-8?B?YTUySUNDcVNUS3BTQjVRS1NEcEQ2QXhnSUYxMitXR1dBdCtlVzdNaTNoZ0Jo?=
 =?utf-8?B?SFRjRmZwOG94anA1VnpMSTF2K1QvdDJVanVISnZwbjRueEcvemlpNU8veloz?=
 =?utf-8?B?TTdFVThybStUTFlGQTZ0ZTgzb0liZUdocUNTVVdvdXVkbUJsZ2VrYUVsNmxD?=
 =?utf-8?B?UG4zVG9zTjZiaG5TNXZOWXI0enppTkRKa0thOEJCelAxL2JkUzBlckswclhG?=
 =?utf-8?B?Z2xMSXMvZjZPeEtFK2tZRHA3cHdVbUVqVlZ4VzBXaXZGclU5M1d5cU4wWnBX?=
 =?utf-8?B?NUc5RkJKb0kxL2Y3ekFsczNXVnl0NFlQQURqeDFNWTlnTXhOZmFpbnF1QVQw?=
 =?utf-8?B?Mk5xQWxIc3EvZ01pejd2U2xIOHUvdGFVVXhOOHlXVzFoR0RvcUxWOFlhRXNm?=
 =?utf-8?B?aFZIdjVIUGlNbnEyQis2Z2VVaFRJRGpzQjJyd1Vqc3p4dXR2Vy9ZREg4dzlF?=
 =?utf-8?B?dlJlK051L0g2WkVSTFVsQURMYi81TnBsWG1QRkFxdTRHZkk4aTM3bzdXdEx1?=
 =?utf-8?B?bzNkd0p5dzdMKzVOOTJJV0VKRm1lM3Y0ZXd6NmFmL2VBcVJxQTFCUzhqOHpl?=
 =?utf-8?B?N3U2cGhzU1RYZWpPN1orTS8wYzZEUHdGM1VwcVkyMy9iM0dQUUNZV2piblRj?=
 =?utf-8?B?a0tOdXE4QVFJL21DUDVNS29SUS94UUxocjNYdkZVSThCTlZzZ3dhMEYxQzA1?=
 =?utf-8?B?WFV5UVBVa2dHMUJEU0NrYUNqVEw5V2pRUzlLaHZtK2dJYXNXU3hBaHFwTGMz?=
 =?utf-8?B?eU9tNmxuc2RYdWdIcmsvWC9VdEsyMkVkK0VtTzNmV05RbDZkdStUQ2pNMVRT?=
 =?utf-8?B?eTRldkdXUFd5a2xENFRzQXY1aVYxZld1WVdqcSs1ZWlRYWdYZWVWNk8rb0Ey?=
 =?utf-8?B?SXlaK01iRHBaQ2I2WUlSVTF2TXJpWUNCeGR6QWJQUERST3BRZzBaQXN1bE9U?=
 =?utf-8?B?OVppQTBHdU5rZzFzS2wxbmZkN2ZqQXNLWXdRbVJCcG1hbG1ZSWpCa0FCTWhW?=
 =?utf-8?B?YWxZTHFWTXpzcWxNek5uSUdZR3FoajNXNWMvejFoZWZuQVUwZnZqY1NiWHRC?=
 =?utf-8?B?UEpDVGJNMWIvRndYcDloN0JLangxdHhDK1YrWVBsT3BMSXptOGI1UVhMNVNY?=
 =?utf-8?B?amVpUWF3dWg0SXBWVC9qRE5CWFhNbjVsZWNoU2V2M05yNnZBQ2lmOFd2VzVv?=
 =?utf-8?B?QURtanh6NnhkUzBlT1pNUmtDMGV0d2V6ZXRFZjV0RWErMkdXOEJvWjRVbkts?=
 =?utf-8?B?aWhjTVBXcWFLTUlHaS9sQU5PdnZ1TURBdUJFUjRva1RzNlcxN3ova0h5cGo1?=
 =?utf-8?B?Nnp5Y1BjR2hjb053YUxTaUREUkxDYlJBdzZNek1BUFJiaWF0UTBWVTQrY0h3?=
 =?utf-8?B?UXZBSHlHMWxKQ1lVTitUa1FFOW9yWjg2Z1FhalFXWlJsUzI5THFFM3ZHTUcx?=
 =?utf-8?B?dCs0MjUxTFM2VFZKeG1kN1JIbGU1MEpHSURLVWkxQ2xjMWtGRkJKSWRLWGdv?=
 =?utf-8?B?VU5ES25ndnZiQS9PazJKaWVYblhVWUdPU001QnZBdGJUajltd283cVJGbzdz?=
 =?utf-8?B?djh0ejgvelhTS1BGcFZTOW4vVzcrMkVibFI1L3JWUlRaT0diV2dxbW96ZGY3?=
 =?utf-8?B?UzV6dUxqemFNclA0QnE4ZWpOQ0d5aE1WVFN4cDgzV0hhYld4VEVKbm5CZ1M5?=
 =?utf-8?B?d3JUaWQ0ZTdOclFJZlpYQTBrQjl1dUtpTytSVVM0S2lmSWRHekNoQ0FpZmZP?=
 =?utf-8?B?OXV1TlkwVXE5TWdQZ2FwRXBQZlY1RDNwVXpZQU0wYmlvME91OWdIQjczZmQr?=
 =?utf-8?B?WnNjZVdRU2NvWnU1bDhFclZjVEhKNE5FWG9OU3M0YzU4ajErQlpUVHhiUldp?=
 =?utf-8?B?RDNOT1BJS2lEVkpuS3BjRk9tNERkdFg5eFNpaU5GM0t3SHlqL0dRWXNDbjJs?=
 =?utf-8?B?T2dobU9uUDZQeCt2anlCdkhFNDhmZkw5VlRUUHA5dnlZY3RuVnBablVvK1My?=
 =?utf-8?B?aXdvQTUwNUI1d3ZST0dTbitjemV1bktWV2xBc0hKckZlcVIzRmhTWWRZamhR?=
 =?utf-8?B?bzNubGgwZ0VRV1dyRVhyQUlCTXFiYnlhVjJtd1NsakJDZFFtQ0N4c2UvNVRM?=
 =?utf-8?B?eVFUcFBsWmFDTHYvdDZvZU9LQmpGNE9LbitCSDR5dWxXYnVBS3VOT29hNnZ3?=
 =?utf-8?B?V1NmT0R0R2pOOUlGRmdIVTV6NEROWXBUWVFIL3IrS0ljNnNyd3pIdnFZU2hP?=
 =?utf-8?B?MUpsbHRGbUhHa2E4RjBzcmhsMlFoT0hhczA0SzRjK3VWNzdwUUxaQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5853bc-7dfd-4119-f6ae-08dec71c564e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 18:16:05.7528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWmzxN6awUuAsJbiHlrBAU2/kdQaW0aMkL9Xxu9mFQn0f+lZ4h/IwVNaLv8VxM5PbDLoi+/kkKvK9Wx4qwBBkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238

On 6/10/26 10:49 AM, Timur Tabi wrote:
> This patch set transitions nova-core to use the new "TLV" firmware image
> files, instead of the ones that Nouveau uses.
> 
> The current r570.144 images are a mix of binary headers and ELF files that
> are cumbersome to parse in Rust.  There's a significant amount of code
> that just reads in a struct, extracts some offset, and uses it to find
> another struct, only to have nova-core use just a few fields.
> 
> The new format uses a sequence of tag/length/value fields that can be
> iterated over.  The script that generates the TLV files,
> extract-firmware-nova.py, does the extra work to find the specific metadata
> needed by Nova and packages each one separately.
> 
> The TLV versions of r570.144 can be found here:
> 
> 	https://github.com/ttabi/linux-firmware-nova

Hi Timur,

A quick heads up on this, it works for Ampere and Blackwell, but
it is failing on TU117:

<redforge> ktest $ ./tests/nova_basic_tests.py 
PCIe Probe: PASS: Chipset info: all 3 GPUs OK
  ok   0000:c1:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revision: a.1)
  ok   0000:c2:00.0: NVIDIA (Chipset: GB202, Architecture: BlackwellGB20x, Revision: a.1)
  ok   0000:01:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

Get GPU Name: FAIL: GPU name: 2 of 3 GPUs OK, 1 failed
  FAIL 0000:c1:00.0: probe with driver nova-core failed with error -2
  ok   0000:c2:00.0: NVIDIA RTX PRO 6000 Blackwell Max-Q Workstation Edition
  ok   0000:01:00.0: NVIDIA RTX A4000

dmesg:
nova-core 0000:c1:00.0: Direct firmware load for nvidia/tu117/gsp/gsp_bootloader.tlv failed with error -2
nova-core 0000:c1:00.0: probe with driver nova-core failed with error -2

<redforge> firmware $ ll /lib/firmware/nvidia/tu117/gsp/gsp_bootloader.tlv
/bin/ls: cannot access '/lib/firmware/nvidia/tu117/gsp/gsp_bootloader.tlv': No such file or directory

thanks,
-- 
John Hubbard

> 
> along with instructions on how to install them.  We are not planning on
> submitting these images to linux-firmware.  Rather, if this patchset
> is accepted upstream, I expect the small handful of people who are
> actually working on Nova to grab and install these images, which needs
> to be done only once.
> 
> There are still opportunities for improvement.  For example, I would like
> to get rid of more GPU-specific code, especially the GA100 quirks.
> 
> Timur Tabi (8):
>   rust: firmware: add request_into_buf()
>   gpu: nova-core: add request_tlv to load TLV images
>   gpu: nova-core: add TLV parser for firmware files
>   gpu: nova-core: transition booter_load to TLV images
>   gpu: nova-core: transition gsp to TLV images
>   gpu: nova-core: transition gen_bootloader to TLV images
>   gpu: nova-core: transition fsp to TLV images
>   gpu: nova-core: update firmware module info for TLV images
> 
>  Documentation/gpu/nova/core/tlv.rst           | 172 +++++++
>  drivers/gpu/nova-core/firmware.rs             | 451 ++++++++----------
>  drivers/gpu/nova-core/firmware/booter.rs      | 328 +++----------
>  drivers/gpu/nova-core/firmware/fsp.rs         |  84 ++--
>  .../nova-core/firmware/fwsec/bootloader.rs    |  72 +--
>  drivers/gpu/nova-core/firmware/gsp.rs         |  56 +--
>  drivers/gpu/nova-core/firmware/riscv.rs       |  71 +--
>  drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
>  drivers/gpu/nova-core/gsp/hal/gh100.rs        |   7 +-
>  drivers/gpu/nova-core/gsp/hal/tu102.rs        |  15 +-
>  rust/kernel/firmware.rs                       |  45 ++
>  11 files changed, 575 insertions(+), 733 deletions(-)
>  create mode 100644 Documentation/gpu/nova/core/tlv.rst
> 
> 
> base-commit: 9eaff547805f8556992a9474465001c3e128b7bd
> prerequisite-patch-id: 0a9ea098bc3576171da9f6293065fdb4db552466


