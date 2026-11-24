Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530466;
	b=G20LRx5DMvXPmEWkKIDrRKrLYmQb9MP2QheGDkhscZzB4pmEmDYEgVWodCVvLJlIkE8u
	 s9rwn5U+xh5wxGa16/gU06KPuOBkyZ8HREJYMSt4nF4lG1EkCw+3ycPl1mcd/qL1Nqs9b
	 TIXXPBW2snLjmdIIyhMAoVP/NPkvMf+zVuc5Aguc1593x2SyU+gAyj8PzoH0O9zkPv5GL
	 aypwGnmeBg//81zs23Ne9hQp2N7yCjgvSKKoKiun6ACN9JpNdeFoVikbS9/uSjwTrXXh1
	 IgFRSXBZsCPk5HxNQ8fSgZY+c7owwSt8oPUWxa/2/XjPZzVz0UBykw0YzEqlPyHEkog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530466;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=sKOfwbAt+heR0dKtHu4cuRxNVAdSjSTo5ad6JHQB+Wk=;
	b=q+3NnV5QHFPcrcgOmUSQtlGpMW+6BD5ZK6F1xN/Q0pQAaEiZcI7bFg29aVRauoVA8Ji4
	 SzaShhh+vkfj5o7auF1A46kfjYCK5JBoGW/4dHWvwASVKWVGlFDmEnk4ud2cWLr61Og1e
	 oLumDMy5nen6wozUZQvB2KS339k+qZrEmrzDmxyqWejO2I11ussXYQF/WflJlI+mxt9Bk
	 h31P9v5RB6puz8Cw2uH3ENz7yl4MRKPWZiUEtL++GIEV1Vv0xnLv8RgKqr2KP78XOS8Ok
	 8LkM9g32M1t180q/NF/zi6pIUzFyomTgZU9UraUKiRvMEOvwRhpog8ngNAg8sxQYYuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=r9nItJqk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.196.80
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020080.outbound.protection.outlook.com [52.101.196.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB91606A327
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 14:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB91606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=r9nItJqk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+EIL6u3NarJ6J+i8cFocwSgz3rn7xjPI1hlsQtfTbS870rnWgkV+cJv1RNQRcJHWT8IKXAGh1ZEsY4pW5LT0jQP9+LMbdSERRb0x1/X7tQG5jmDb1ZkcWD2GqtQqIu911HMUzHvl/EbPJm0DgFQBdrzQgHH46WMqLayloEzYJQfTAYESOCFhksIwhOc7AgGbWb+JZIAe5w/mOdayjvxbHi8V3aM3YBULylDrYDdp9+EqI5akwOARzitmBqgvMfN8VGLR6NYB+5y9la/O5r2fEHUbCPklO5Yw/uux8PS26R4SXof7xrM3lKhNDfyOT7LDwGv34qDE00B4k7j6KbQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKOfwbAt+heR0dKtHu4cuRxNVAdSjSTo5ad6JHQB+Wk=;
 b=wxUuMChiBx8XvDeiwHGk7Q48vaWwiEnoIZdGgBCvwPXWmkVZ2DnG/1leJTNzJIACisMbM343XfGXJbaaSi1SPXJjdtRnsRAuXz7CPgN7lNGmEJPpocEbaBlrZto1SDHsMJcTjZjCT+J56IUJg5hWd69FVlJ7ei1a3n0NALznw7GSLJh/bDh4Mo0Q/QA7s+rP3o6I0DpDtjeVoFEqOuZnkDUarc3N1HlvkVGD5u0IKEK4M+UnqFCb/BnpQ8LlCQr2UUX235X7epYbwwuo+PSRvaxIAaFIdDXhH5Wib3Qu6QHKyVBTLBI3KxhsBpSlnJXd7MEo3VeB+TOK/es1Zthe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKOfwbAt+heR0dKtHu4cuRxNVAdSjSTo5ad6JHQB+Wk=;
 b=r9nItJqklXwKm2gXkxOx8CK3IEC0T3rz1F3XpZmUsVNeNTCCNxGB6sH9TRvdHtgvvO/scqAHQZ+wQqWI+bALl1bYsEWIlyClWXCwpT+ED7lnoBsNHeRrMLYbe0z8QBxUBkv/aNfn+8PB9qtsr7s8JiajSRefYGVE8JiQ6ZXrBeU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWXP265MB2581.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 14:27:43 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:27:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 14:27:41 +0000
Message-Id: <DN3IFEONQXEX.3471DEAR6S0W0@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v3 0/2] nova/nouveau: add configs/module options to
 control binding behaviour (v2)
X-Mailer: aerc 0.22.0
References: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
In-Reply-To: <20261124-nova-nouveau-gsp-v3-0-e1440479ded6@redhat.com>
X-ClientProxiedBy: PA7P264CA0477.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::7) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWXP265MB2581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd00e37-e926-45cc-8313-08df4a3719a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|10070799003|1800799024|10067099003|5023799004|261021123027099003|56012099006|261022105027099003|261026121527099003|261022075727099003|261021121427099003|261026140227099003|261009223327099003|261009223027099003|261009221727099003|261102123227099003|261009221227099003|261028144727099003|261009220027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GfCRwyJp5jc03S6rXFn3f01+f098H5jTycEamC5m4BJNhPLKgAvsnGKCPDalY7chy3xmBFZ8m9HMvuUieOzE9vGrgnX1rU2MkGTDDDr+OGuKtgyPZxn5n0/7Uh5oUtGGD7Si2JSF/T99PuHg/EkI99X4gws93cpIiKISs8TeBCgr7zMfY3pdRKxiv5y11ptmO57Uu0foA4fF4/AESdfK27mb1ZYtUiaXuwW6TeHu0yCfHeUM2imim/BX8nZQqiywI6n1lD/SvNab7kAjlWPoSGoqvvH4zF/iriEzgdcB8xwBDpJ49tQriF6i3xb0QrBBSrUslPQTvjbHK8QtuQcYgl3Y/G+XQ0i7B9/GU0i3IvSCy5lzo+3D7W03i8L3Rz3dfXVYssDsn9vTFITpfblnnD38TxfMkGBCSSDBbtVNuwKAJJSr+wdvq3xmmyRSf9aXSlNZxVdiOhhkX/PqrdJ5hEdha2uV2/UJVbi+xZIqse5RC/QRStnZwjtn+/dJsPbwu1I/w5dGdK+w9Vho64UV2Kie83j18NRb46CZezEEOcsL+odVHpbX6KZgxF+zcLOYN7rv/Sq0OYBtVrvYm/j7mxD2PvBcRWalPVgCB0iq98MF8Pca4/6avkhqhvRufn/7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(10070799003)(1800799024)(10067099003)(5023799004)(261021123027099003)(56012099006)(261022105027099003)(261026121527099003)(261022075727099003)(261021121427099003)(261026140227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261102123227099003)(261009221227099003)(261028144727099003)(261009220027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUNaYWl6cVNrcHRlbGRXbDRzVVd6NlIwWDNOUmR6RjU3WVZUVVBmeElXMXlx?=
 =?utf-8?B?RklWNkZFV0pNTWdTTHo2TWNFZkZocHcxVGpoZzJCOWRCRUp2Z3dLZTZuemN5?=
 =?utf-8?B?V3NOd1VJdU4zNEFwWXRMWmZOL1F0bFFkV25jd2ZpOXplSEhSd2Q2OHhVZnB2?=
 =?utf-8?B?TTlaOFN5dnVIMCtmOUd5S0d1ZlcwMkIvL3lKakxpc3A5Vm4wTGUvNzU2RGJF?=
 =?utf-8?B?NXliSFc0TjYrOStoS0FBZHNFQXBTVVRyN2grWThiUjMwODljTmFVZE5QaExw?=
 =?utf-8?B?SUMraFhEejdGS2RhWmJHQm80RUU0UkJQQmNBcDhVMGJMOTNmRTdUVEF4SHFF?=
 =?utf-8?B?UTJueEc2dTRqbGFIeGlYa2pqdnVkM0pJZnh3MTg3Zk1YNHJsa3BmaWRKNDM4?=
 =?utf-8?B?NUcvR2hBbENNejhYSVJoS2d1MW12b1lvMzZWWDFFc1JKbUsxNk1wSHBEUmgy?=
 =?utf-8?B?bUhDOGxCQ3FLcUhMOVp1OGNyRUVBS2dLbkI5VTlJOVd2UjQ4YXNZRG5lR2di?=
 =?utf-8?B?bHhEQzYrTjVMRUpnRHNQNklieXltdlpFUUxpejlLVmdiaVY4SDhFNWYrbHFX?=
 =?utf-8?B?SGJTeXgyejhqZk4vYmtlSkdWTE13bnl4aU9PYVNiN3R6QVZMZ2RjTHBSU2N2?=
 =?utf-8?B?WXd2VjZSLzFwTmVIUDdVWDMvMVg2WjF2Zm5hRUlNRjVUMVVFMXM4Yld0U0hh?=
 =?utf-8?B?dGhkUlhaUVM4ZTZGM2ZVT08yb0Naem5maXZydjA2MEZZQUxldWRrZWU5bVFU?=
 =?utf-8?B?K3h4RTN2Y1RIbVA2RXgzV0lENnRYMWhvNVJVWlZjRjMzLytRdlBpWUM2a0Jm?=
 =?utf-8?B?OVJyelNySk80eXlkK2RHRzFGMDJCT292dVk2bEdGSEdUVWRRZmJEVkY2NUo1?=
 =?utf-8?B?eVQxb3VydWt2eDkyQnJOWE9XOFFIQjhkblBYL3FvcElMRjdTMkhzTFVNYnh6?=
 =?utf-8?B?M1NFc1FJZmhBa3FOUVU3ckZnYS91MEVEcHZkVEs4Z0FjaWFJdjNkOWRJNUdz?=
 =?utf-8?B?SDZhcnRkSEZudlV6UzQ3T1VxYUloWktKUFhMY1ZFRFlUS3ZFV0FZT05DNUpY?=
 =?utf-8?B?WkdCYlRNQVF6TUhUNzJhYjRLNFllOEM5eHl4bWNmRXdKakV5RDBZQWNzWDgz?=
 =?utf-8?B?anZoNmVWb0h3bkEwSHhsUFVNV093UUJTMld6VjJZeHRDeHlkQkVHNG1mN3Z4?=
 =?utf-8?B?a0RuSUpyNGtXdmFCS29RMURlZlBmdHlTSFNIWTBNckVzNkRudjVac24xK1hW?=
 =?utf-8?B?TmFKWWRLdE0zM1J1cTFmZ0tiSm9NNDlZemQ1Skh6RnVNMUxxREEyVmNmNGFw?=
 =?utf-8?B?VUZETFdHUFBIb2NVSE1hV2NwYlVkcU1HSWR3VmR2bmsxUUl0T3JmV3UxK1RJ?=
 =?utf-8?B?V0RCeUNRaFNPRGs1OE1Vc0xzZXJSdE5wc242enNiUnV5Z29ZMlBlNVhmaGFO?=
 =?utf-8?B?dXJBQjFTSUFHaTNjc2JkZGtkYVljTFBha08yQTFrRDlRbDVDOVVQcHpHU0lH?=
 =?utf-8?B?bDFGSWs1My96WXN6clRLcmhNa3dYemRvcE9RVjgrSW9hR3BPanpDb0dWM2Vq?=
 =?utf-8?B?YWFleUFldU9OaCttOTA1bktWSklnLzlFYU5hMmg1Z1Z4MG9ZNDN2RUNuVXVv?=
 =?utf-8?B?R0V6MENlU3ViV0RYT0xTczdQRWNod2hWTHlhbG1jbVJpbkhWWlBqZ1ZxV0Z4?=
 =?utf-8?B?RzJOS0YxdDN0QzZFc1NtU3RaRW82TGZSOElTU2dnOW81eUtUbngxN2ZGcUZ4?=
 =?utf-8?B?VzAyMVNYcUFXaFI5dm9uK3lQYXp2QW5DVncyUjF1dzYrVkhmamtWQStKSG1a?=
 =?utf-8?B?NVRqMzZMWmJ4UHJrVytUT2pqNk13WXJML2MwNksyYzZYY1FKK1RuaVo3Nzdz?=
 =?utf-8?B?Y1g0S0F0TnJ5VGduRjRVYk5wcDhWOE5GYXdCUFdidGdieFBWTC92NlpNMTQ2?=
 =?utf-8?B?QXZ3UTlOcU40NXY3Tzk5cGZXWTlVQWFpaDJmcjg0b0tHTWNtaUF4NExVeUtj?=
 =?utf-8?B?S3dNSmVVTzZRMW1yd0Y2Zk5xZ1BGTlV0cXROUUh3RFUyY1ROVlByQ0duRXkw?=
 =?utf-8?B?aDFmNnloTGwzMmRuQ2lKMFlpVDh3c2RxK0V2VWtxWDhzVWYzdmFrTDJRa2Zo?=
 =?utf-8?B?dFVNWGxldG9oRkpkUWROQTJvaUxnTjdOYUhmRjdGYXphOUdKUkh2VWFERGdx?=
 =?utf-8?B?MXBqZmoyaHVUMWEzNC9MWkJndDBvQmliRmpVdnE1ejBlTG15MlJwRWFFR0tn?=
 =?utf-8?B?ZGdUQU50NXNqT0Ewc1BkN2hsNnczNW96WStPQkYrbHR6SmlyQU1mdUY5YXUv?=
 =?utf-8?B?WlVmYktvMTV5T0p5eDZZbW9NNmRkbXBZNE1ET1BQemg3eWhFd2cyQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd00e37-e926-45cc-8313-08df4a3719a7
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:27:42.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGoc39S7VRbI9Sl9ET4jVD17ZFCtdCdzNeGaNWtT0KDIb5h4DKY6VyAnH78hLZI57zHqhHTQ/O9JtcCuzWw8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2581

On Tue Nov 24, 2026 at 5:50 AM GMT, Dave Airlie via B4 Relay wrote:
> We want to be able to build both nova and nouveau and maintain the
> status quo for now of nouveau binding to all GSP enabled GPUs.
>
> In the future we may suggest switching the default to nova, but
> for now the default is to let users use command line options for testing
> and developers building their own kernel can set the kconfig.
>
> This contains a precursor patch to fix the nouveau device cleanup paths.

The patch series say "[PATCH v3]" and "(v2)". Any reason to append the vers=
ion
number? It seems redundant (and can get out of sync).

Best,
Gary

>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
> Changes in v3:
> - back to single nouveau patch
>   - fixes ctor teardown path (Danilo)
>   - fixes passing bind_gsp flag (John)
> - nova
>   - move to using a function (Danilo)
> - Link to v2: https://lore.kernel.org/r/20261123-nova-nouveau-gsp-v2-0-5e=
8c27aa8555@redhat.com
>
> Changes in v2:
> - nouveau dtor path is broken, so fix that before adding the new code. (S=
ashiko)
> - Link to v1: https://lore.kernel.org/r/20261119-nova-nouveau-gsp-v1-0-4c=
de2bc41132@redhat.com
>
> ---
> Dave Airlie (2):
>       drm/nouveau: add option to leave GSP-capable GPUs to other drivers
>       nova-core: only bind to GPUs when explicitly requested
>
>  drivers/gpu/drm/nouveau/Kconfig                   | 17 ++++++
>  drivers/gpu/drm/nouveau/include/nvkm/core/pci.h   |  6 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c             |  9 ++-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 67 +++++++++++++++++=
+-----
>  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c  | 11 +++-
>  drivers/gpu/nova-core/Kconfig                     | 21 +++++++
>  drivers/gpu/nova-core/driver.rs                   |  4 ++
>  drivers/gpu/nova-core/nova_core.rs                | 23 ++++++++
>  8 files changed, 139 insertions(+), 19 deletions(-)
> ---
> base-commit: e55a991e09e3b44f0b0d8206bb523dc57c086341
> change-id: 20261119-nova-nouveau-gsp-10f8782498e4
>
> Best regards,


