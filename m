Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BE930B529
	for <nova-gpu@lists.linux.dev>; Sat, 25 Jul 2026 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784986092; cv=fail; b=GEnCKlEikPM/HfxefExxBXYaMpgKX29feXTa9k1SJuntwBgAE/ZQKt1OOHI9QqGYpTTH+Yow9vl6vpOXz1iDyS5+oZBd6ww16tRm6B+A1zO4Tp1JOGmTTP4tsoYRDh4y3ERuY8Bb7VMED20xRu/8FttO8hQOqSB1WTKAow7NGbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784986092; c=relaxed/simple;
	bh=Kqv011k5RirthizqF8spaipH1thYu2uq7i2j/PcL3Hc=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qre9zS2YW7Sw6n1m91e/Ch5IIUCZsmCmRFQv/9cetf3tE2+lA4ZIjS/QIgIjZSXD1HqVs7whrtbO0pcGaSLeG7ELrOJJAEA5PO8vGWPBEh3BMpRG6p+y7dQIbfpBmv5Fx7kUAbo6Dk/1/qkSrSTkx+xV65Mrgb74ZCFfyFRspVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OUeNqzvV; arc=fail smtp.client-ip=40.93.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OUeNqzvV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tuu59hnJ3z0fy1h5/yTwGSGF5KQ3ZyhLOvlS+ceW/dAxNCyZlTYVCyqWdK0Zxk9i9yC52ks6iEJtMSbd6q315+nnbOvyA3cZ3U2heMZPTdaRDwmVNbeoitsHbHEBTTxNSBU1vI9rjfRvZ1WkZLvXgXXXXZUETyxu3WBK6oM15y7A0HWB8UOM8Rb38dVhgrCCq9UBwc+LnfdD+RfWWyz0HkYd93+EgkghP6cM36fedXX2WO3cVMf5lHl1dP/AcSfRhkQLbC2N7C1zZ3x7uKUfvmQ+LBhRjUBwn8dg/qnATU7noG+axo2bd93PxUWovNOHUdcEPk/jE4SLRUEABHijlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxhgnkIdx8rnHM6UekvkmfIyMk/+waBpu97xhqlTFOE=;
 b=Goy67TwxK9VRCIUez4gvcQ7vm+D9eGKK55RI3GLlxh4y3NHSh79nckpapjEt41p/qvq5mjJY3SHeqjgqA2PDu0N82NFTaYMK0N6en+CG9JTv5T59E0By+imXB+ZOgOybZRe9sPWt1l2ba53l7/6zbWrfkfa90Wog2o45Iu/o9n8rvnWnsk3kOB/2dr9jNmQrtbSJnxnhIC4D3HOYeMJ/0pgDB/O0c/o75zKcvUBjQ/pW1p5k9T0DwAsUsy56JINKInD+yjiz87LsXsoJjbPOHLVsDhRPez1eySVffAO1syLxbc+uLM5CDEwy/Qgl4InVNL85Q57mf0TY0W3mPalKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxhgnkIdx8rnHM6UekvkmfIyMk/+waBpu97xhqlTFOE=;
 b=OUeNqzvVxJ9gL9mJiHb/WOtrPaKq04USHXSnTAc/65sbuSj8JySaW/fBIxqyoQyqU/wv3/8WszZUPH/M8Wjq1nJzSMgHmZeDAJIc8Zg/bjHWjEH50uQtvgq7BhrUlh/+SIqcsh491Jhu207V1ydYDCGMSIUWyBeQIVGj1Cubj+8fBNOhxE86XlViz7rGcC5H+jcc9a8nz51nIbAFgOjujxbkUnx/5aoODEsGTuH60TAhZGMoIVt61/IXO6q7V/aW46jU8Mec0IGyJh2HF9SJ74kYXcxS9HaLN+jlg4mQ1k2x1MWNVkhAzgSe9ns6kWvR7iq9jzC/g3dxePtn8FNmzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 13:28:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 13:28:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 22:28:03 +0900
Message-Id: <DK7ORAEDUILT.3788O3AIQZQUO@nvidia.com>
To: "Nanonej Dev" <dev@nanonej.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/3] gpu: nova-core: Move one PBUS register definition
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
 <20260721-nova-core-regs-split-v1-3-384fa2a42244@nanonej.com>
 <TPL-Nmz1jd_sB3sr_x-746jIwTxY7IRTMU5b8jwBv1ice0C31BNvqzUzo3s68ZkE1-mfZHAx2SURO54hHnbR8CUPo3rNLnfHIs_ujtl8D_Q=@nanonej.com>
In-Reply-To: <TPL-Nmz1jd_sB3sr_x-746jIwTxY7IRTMU5b8jwBv1ice0C31BNvqzUzo3s68ZkE1-mfZHAx2SURO54hHnbR8CUPo3rNLnfHIs_ujtl8D_Q=@nanonej.com>
X-ClientProxiedBy: TY4P286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: c76fbd06-451f-476d-7dab-08deea509038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|1800799024|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SBZx91BrRMaZwsA/4FEVvAM8nzQDsROFIspdVpx4yKYYC5Ye0e5Ei/98seZdrAbF8v8M/3vycDej1oJCLbK40TbQr9xT+sRzNI+97BWwBNh782GZX5T/7IgBGg3nvURo6Z27gK1KEF203cihUXC1ZyZ+vOlJX2sDFttoUZnhi2MrBea8Nf/JkBJYPp5IzIBGExewaze8/2V31kYTzxYR5NxDQxrmcMFUxdYfXlHo6D7oQhFRUEL19ibV7H4rj2f6Tq4b+WIknAW357wBuD9tNmmitnCSHF0yKiHLk0tuZJYQ48XGrlrJ5TtHNkkq38zIWDtG/dLquYLWHqImwHDcXz2GTPGOFA7LpA+lqAtdrY3px0haFKbXlu4+gPXRYHSoig8U7AXJkyBfG6tMNBOfwcbvQ1W79RPdB95On3U5W9vcHFUG5iPB+93SbFejT2nSKFUV5IJyKO02og9IYdrnH0lH4bVJQLdgcCwKVW47hWalfWzixrHYFVcK8hRQLCBYTybmx3kN88R7w6fKkJDloiBMfLcA2WC5/4s4T0cmMA6Uzf5hAlG7Pk/NguCHhmCBIsGa1HQyU8pVkymzy1e1LC1jK/q/e674tOYSGB9BhPnl8OlMcfkRTopCfv5DofCnSqb4J+OZO79j64HikBYZNmtAGc14nPVAqxH80/1aMkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFsT3pzRENPeVBtUlc1WFZBM3g2UG9zbjBCb3Z1bFRickd5TWJPYXBqUDZK?=
 =?utf-8?B?T1c4OHo1azlJOXIvLzlnMWhKV1F5Njhyczh1WS81bkQ5bFo1RzVNZ3VLeUp4?=
 =?utf-8?B?L0V3cldUQ3F2Yi9OZnVqVEtSdGcySHdOWHdFZlJ4YjFVam5taDJmMW52bk9h?=
 =?utf-8?B?RU9VS1hFUlhNNkFVWEQxa1M3VjBvY24vOG1QOFFqTUEyQ1lZeEp1QWFrbVhs?=
 =?utf-8?B?cVNvQ0MyZDJTSnorUkNNUUdyUHRzbHBFR0daT0UwekFLditYNjZ0RlVyV2tE?=
 =?utf-8?B?YmJKNERVdk0zWXdCYm1BWGF3SUp2WDdWcjJwOXJCL1lGT2FldmlmS2hsNkhm?=
 =?utf-8?B?SUVRQ245NEJPZUk5QlZEZ2xxT2h0OG1ZTytCUXcyRCsxSE1oMENWaGoyM0hW?=
 =?utf-8?B?MWlObzArMVhsMDBiOHY3aGdZOHI1clE4VjdpWk9GeFF6RXAzcVRyelVyUjJC?=
 =?utf-8?B?eTRkU3NkVVlGUi9vY2RxbjYxbUZPMG16eUFIazNFNDVLb3VmenBXOXVrT2tC?=
 =?utf-8?B?SkVJYnFkOUVybnQvU3BpTXUrMUx1cXpKKzNEUGE1ODBDOGlVQTdHMDZpTkhq?=
 =?utf-8?B?OGxKNUpaVVVocGxDb1V2Ym91b3c4cWw2clZXajZLM1VQdEI3WE45QkdNeEx5?=
 =?utf-8?B?VTd3YUllRHZ0N0tZcVFMRG5wN056NGNFTFdYOUNUZVZsRXZ3S2pqRkFUeWhI?=
 =?utf-8?B?VFpXQzhyQjlvV1UxRkxlTHozck15a1pWS3hXampVcG9KOG5hWGhwQ3VTNXZL?=
 =?utf-8?B?bFl3dHM5anlkc0tvakJPQTF6Vy9paytXS2dhcE9zK2swWFdtR0JmdGpqUEFH?=
 =?utf-8?B?Tys0N1hPWkVMb1FKM01maUNidmNuTXdvNmkrVHRGOXhwdWU1eE9JZTM2eklI?=
 =?utf-8?B?eTdhU2dFM29BRFlJMCtmS3lQRndTTEp4VXNqcEUzMk41b0ZSYllTSU9QMzhS?=
 =?utf-8?B?NEJWSG8vdHBJSDVkRW1kYytQUG8wamNsdXkzZFVycUtLaVIvU0RUOXlORzZw?=
 =?utf-8?B?eDNLdjZCbWxqT04rT013ZFgrc0R1SUNibjhUZGRselV3M2dlN3UzVm41RXcy?=
 =?utf-8?B?S1FVeGJZMHRzMHFSaUwvcm1GMytBcm9TL0VDSVE5NEViamVPaXhlNlBpL0JG?=
 =?utf-8?B?UDhaUGFFNU82MlBac1R6UEVJWEtRbEtlTDYvRGtFQmdsQmdUdm10M0FtV1o3?=
 =?utf-8?B?Nzd0MG83UmxyM1FGTUpDemUzMlBVaWFUc0wySmxROG5XdEhBaUlyanhIQ1Nv?=
 =?utf-8?B?M3NCUWJQVFhyemJ4RjNZc0V4LzVtQnQ5SWhxWUNLOHBCODBXOGdwTUpDd2tY?=
 =?utf-8?B?aXBReXFrRTZFNmJESHNEdnQ5M25yc21qZFVPZEpBTjI4K1J3MERxTER3TGxn?=
 =?utf-8?B?ZnlVTGZkRDVBL2I1Z0RrWGdRVlNnYUt4eEV4R3ZMLzhOWEVOZGtVZzkwL0Y4?=
 =?utf-8?B?UmpuVWE2TTVUa2lqZTY1ODd3eWhHeFpBS2YwL1RmMzcrVGJKV1hGL0ZNelRJ?=
 =?utf-8?B?bHA1dG9VbG1JLzIwTmxWM3RvMGdTV2FHWC9oOEFUSHVXK1EvMlcza09pRHVw?=
 =?utf-8?B?TDlDWVU5NU9LS09qYU9OMzVybEV3ZHVUc1EzUm9Sei9tUWg2dXRtRm1peS9S?=
 =?utf-8?B?SmlrVVlIbVF6UHV0YlpjbXhzcUJjdkl0YW9KQlZ6ME90QzU0bDdCMVdtdm5X?=
 =?utf-8?B?TFhPajdFWnpMdC9md3dOZmY1cm9NKzRzdzB6bHdTbGdMNnhFWjhqQ2NxUHZ6?=
 =?utf-8?B?RXhvQ0FFRjN3SFlKMnhMZlZuUWlSaDJkd2tRUmF4aTVhbWFXWkF2T21udEN0?=
 =?utf-8?B?bmhFMjJYNzVkQ01HbGhURUxJK3BvMXNORHR4My96Wktua2tvMm9pYit2M2JP?=
 =?utf-8?B?SjluMzNmUWMyTkVmL280N1dyanlHTDY2UFRvVVF2bTJuV25JS01UTnI0SXRt?=
 =?utf-8?B?WERpRENEVm1FZkFZUG02ZTU2TGZrWXpwdlQxelk4c2xvYXhzK0Z0b1VEd3hu?=
 =?utf-8?B?RTJTeHNtYXpFQ25xK0J4YnZkNmd3UFNtMGUvbkFuNUhFZ3FKYm5KVlNMdUQr?=
 =?utf-8?B?YjZZTFF1b2pldEdjNmJVcDhzZFFtTlU4Ky9xSjdLUHRnckZKTU5nNGUvemcx?=
 =?utf-8?B?QzRadzhucEpQYmRaZHRLWlZKc3kvNE1hR0ZaYXc1NGU5eGFwUWpaWkt3Z3cy?=
 =?utf-8?B?cTR5a1VqS3NEdmloMUppdzNtSVE4UDNFclBRMGRmc3FCN25ZQzVqTmhseGlC?=
 =?utf-8?B?eFlDd0FXc0VBR0hSV2tCaGwzU1l0ZWFzNHZweUlQWVNQZTFXdlNCb05xNUcr?=
 =?utf-8?B?UXRvYWFOQ1ZwQmFGRUY1bGJETGVNWnhvMENBY3FmZVdteGlDSkEyczVweGlu?=
 =?utf-8?Q?ZHtsYXdk87a0AXZf5wva07/gYTPz4Iuk0Fa/1G7rOJ1dG?=
X-MS-Exchange-AntiSpam-MessageData-1: IWoTWiFyxjGYiA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76fbd06-451f-476d-7dab-08deea509038
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 13:28:07.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0XqWEE9ivnA5lWbmAlxtQAolfCixxySAoVkwhr9RmRcpBXlMbQD1+fjAr5xCtOFy+eJS7D7j0eh1puq1natMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

On Wed Jul 22, 2026 at 12:51 AM JST, Nanonej Dev wrote:
>> - Move the `NV_PBUS_SW_SCRATCH_0E_FRTS_ERR` register under the `gsp`
>>   module, since it is clearly themed after `FRTS`, which is part of the
>>   GSP boot. But, without moving `NV_PBUS_SW_SCRATCH` (the actual
>>   register being aliased). I expect you will hit a bug of the `register`
>>   macro when doing this one - I'll try to address it, but the first two
>>   steps should be safe to do and correct.
>
> You told me that I would hit a bug on `NV_PBUS_SW_SCRATCH`, but as far as=
 I compile, I didn't. Anything I could have missed?

I was expecting issues with relative registers that need to refer to a
base type defined in another module; but as relative registers should be
going away soon [1], so will this problem. IOW, I suggest waiting a bit
before attempting to move the PFALCON/PFALCON2 registers.

[1] https://lore.kernel.org/all/20260721-typed_register-v1-0-452d72b60262@g=
aryguo.net/
