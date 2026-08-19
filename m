Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57F3B28D
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 18:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787163696; cv=fail; b=fKmfx0Hg8ZGBCTrNHibyzAfcTZh1J6ySfy5WKFSpbtAHrpFRNUcUx9dXMXQbrusIbsTT5hESfFx2iYBlojOmdP1NSibtMPMIuDLfx14seplJDm/9KWKg7oCIX7B4hgc0V9WGicqH014bkq5n8a0TFI01WeoOh0ReTuzU31U+XJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787163696; c=relaxed/simple;
	bh=asu2dSjZUNbdtYnLj1INczd0PQPxCe/EqytgVD6VTf4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gq5dXpmwhm+rn3YF63rM2RCdZ7iHA+rig2xXWUq9SZph95TTkSQssPGD8HFQbA36K1Iy0PJHnntmJTn/aCffTR2r2W0VLKWCxystdE2z0186GkrQVXyOBVRFXbGxIBWlHNT0WuIzFqPp+uSCYQimeVR8E8m4nYnN1NAYRgm+Myg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GqSSJyk8; arc=fail smtp.client-ip=40.107.200.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GqSSJyk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoH01/qrgP4IJAIHnhOK91DLDTIn/b3K5Q9DBWNaPc8apwJ1EFCkCty/Db8WFjgzAUKVEuTJcxTLiTxDSJVhlWISxip04kUojmN68ZpZ89DmyjJhL2grNXVFJ7PWX1v5xU6Dug+R4I1KSTlc0xTm4iO0lrRdD+pY1FSmir85W6WEdLbLUU88+TCBGR1EHM6CR3+vwRYsIM/L0C5odGco13Rt0gzaLMhbW/uCQ1lU7Cam0CSvjjqmU+M09R1bYITIptCvhq2/zlUVwKswN4LvUSSbouLUk/f9AFYxsQj2O3wmSjlcaQSnVHZEkadb3PtxjoIGhijTijNLDuBauwWriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asu2dSjZUNbdtYnLj1INczd0PQPxCe/EqytgVD6VTf4=;
 b=ZUKW6b4SfikSaDiCgRVMpNXmjGIPi6+16hL6qmIjPnoHPFeAEgCr9LbIQa2PxsV7ihDzz+pvAvHbrgOOgzpvqq41mJz1/r7EzzuDVA9Gw2ZuZvvaOmScsYn4KLZ+JInKhrh+dFqFp4nAWbTexU5ucEAdJiINUhjMraHb6NECo2Ocie75YL6D8dyeeJ51AK/r/kHBEVxK7RVU9kfiNQqIQWSEQVnDmt6GrrmtnXm8GnrrgN9wgW34mHRcaUcoAHvOaQwJ9fQwVbAxFirXArFp+1GAL8KJT28/JmfYQko5X57yHd+81bAc2SssezmOZHOMmD5evrmsI0EcDmf04NbyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asu2dSjZUNbdtYnLj1INczd0PQPxCe/EqytgVD6VTf4=;
 b=GqSSJyk8j4uJUPBZ3LNMQV9ElF4cFVBlRYNG4AdKAea6wVE1SuMLrBRRMX9YfNkZR85Vj/+362E0tytH9nvf2PMKa9OaJjTPYl6HW8CeA4TiUnFtpRM4GMNH/obdOeeGhsVMfSL3boVMMs/QWB/sEh1Lgvd7u7MF7u8wes/qm6X2gcIQWsK0Id3UYO/zE/Pf0eLHob7MJJeJmI1yFatX2OS+KNYp72vUjJV9vyMgxisrtGqYdnlC58lToXLWEIG40kqeJjr0gtdudYItGXFMJjvw7wfbUMopHPu1gxuUYv7biOx7Ts4z2GUu+9CNb0g+UMm4+9X6v21n84mmVbMnxg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 19 Aug
 2026 18:21:30 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 18:21:30 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "nova-gpu@lists.linux.dev"
	<nova-gpu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH 10/27] gpu: nova-core: rename the FbRanges elf field to
 fw_image
Thread-Topic: [PATCH 10/27] gpu: nova-core: rename the FbRanges elf field to
 fw_image
Thread-Index: AQHdL44sMn5QYL5xJUiK9fCcqDVk2balr/6A
Date: Wed, 19 Aug 2026 18:21:30 +0000
Message-ID: <58ca3c142f2cde0f5672df71314d2dcb707d08f1.camel@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	 <20260819035221.336390-11-jhubbard@nvidia.com>
In-Reply-To: <20260819035221.336390-11-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|SJ0PR12MB6806:EE_
x-ms-office365-filtering-correlation-id: eebb6bd6-faaa-415b-c73a-08defe1eb111
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|4143699003|10067099003|56012099006|18002099003|22082099003|11063799006;
x-microsoft-antispam-message-info:
 Y2HXO0S7axCTZNLfZm2vaPnG2Fo4u3qXA1ocUwInFj08dM8iP2vt3b8jB4fSh8QGQcl6RyuXJ/jQDDO8QhTci5QxApq70lUI3wt0PLJHbS6wSE6eWiNpik/ZCVeGH6q95wk+y45hIgJ2KHS6bS/7FnZrkEBCI4mhaE9hiGn+1nT4kMTqV7PTjmsJwHPErStyjvlOn7z6uAIZWdMrLO2WkicxsYTJfXaHKg8DrTQ71UDuYnLGZufHTKUxSE5lmfEmyyPMDHVosGVWOr05baLgTfmS/F8Rs/L46hoewf+NZ9Gry1RYMekOpsbx9eStpOX/E4t9HMCOMpaO/xfR/Nbs3Vn9EfsGqv9dUYmeWZVHhjCMHc6vxwlI4feH64mGO3hW4pcj41APAs/u4NEiVwmGrQJThRcKgvprZQ2s9NEM3aH4un9fJCvfCDSyVliS6IHfaE2f2n9ZtscJXNplD8MgtjmIHjR0B2fmoeI4MRWzbinX5S3UeNJKhWPRc5wpECG+hC4BmpReuqmTw/CzpWz4MIgJh6UKCNmfII99s6RYE8GavIQp8vwsnd9sbcLqHBjWztf51Ng8CFhIJjMOE/z2CaMUAx5zGZL6j7ZXpY491sJ6O5/bxjq/CrgKBC14GaOPSTd9YGFZKG7GGIjOVKNNmZrwc4U5gLXe6jKHxza7G6MrLFcAxXPeSnV/xM5/Mk7ZxVW0Cw5y8HmnxxJ7oFH9mQFmQ+rQlKlT2rNOc+NATM0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blFIcG8xR21scnhCRVNhY1BQTW1KUEllOHpaRWJWZzdnc1lDT2J6VldLaEo3?=
 =?utf-8?B?c2x2SXhibzRSMTJSa0FDVWJPbmtWVFAzaHpDMkovZTNQcDZvOWVKcFBFb1c1?=
 =?utf-8?B?blJ2djFOWGhSZlNJaVYvSjQ2R2VENjZYbzZKMmZWSDJRa3Z3TWl4VnR2YjdP?=
 =?utf-8?B?VVVSS3BzQnhjRDB4Mk9rZFhBQjlFTUV4ZkhMWUFHREJMZS9ydGdvamVSd2Nk?=
 =?utf-8?B?U3dsYXN6YStndDBhbGluWnhqQ1dpRllDazJrVEYvY3dvMU1HbWI0RnZOUElP?=
 =?utf-8?B?a3pDWmFvTjF1NWs0bnhDVkYzV3ZSdDQrT1FMbk9MTnhFaHRrZ0dnbVRObG1v?=
 =?utf-8?B?ZVlsYUxqNFI2c0Fhei9xTlhXU0RKZ1d1bzJLWHBXc3diM0w1WkJ1c05remtI?=
 =?utf-8?B?TnFFU0RBV0JaVSs1MVZLam1XRVp5M3dFMWZkbDQ3TTNuVFNhL2ZHc0pRTmNT?=
 =?utf-8?B?Y2V5ZTJPTEI1M3F0MTYvVDA2R0ZVZXV6dDlhYkdEdTJXSG5PUEVkVmVFdGti?=
 =?utf-8?B?aW4vRXlFTloySXBuT1duSU1yZWlxSk92RWhXUVE2dEhIaU5mc1dVRXJlUG1t?=
 =?utf-8?B?ODA2Z0RtRERsZldwMEZiMk9UVkd5VTBYQ25nYkR4YVZ4b1pUR3JVRS8xN2w0?=
 =?utf-8?B?YVZvWjBJYlpFbFl2a3VFb09zYlBRak5UUVNUdFNNK2drdlE0ZzQ3WmRoTDVP?=
 =?utf-8?B?M0J6dTFtVzcvVTkvdzZoYmRGOHJxTVVMRnVINUQzOTBRdjZFT2EvZWIwMGhH?=
 =?utf-8?B?NHJ6d0VEYjdxVjN1Mk9YSXp0RGtDTHlGMXRwWjE5Q3g1OEVZemhDTGk0YkpJ?=
 =?utf-8?B?eUs0ek1DVm0vMWFkN09MMEhmQnI0VkpKbnlseEtsVmhGc2haU2UyK0JTek10?=
 =?utf-8?B?UHk4QURDdUpnSndwalpzWXZKVmRGdkFBajh4MlB6U0JiakQyTTVUWmlpM2RE?=
 =?utf-8?B?SkNhWGJMYmV6SDRHdmd4MFFUUWJSbTlta09SY3FQMkVVWnpTR1BGL2Yydlk5?=
 =?utf-8?B?bjg4RHc2enJrOThkLzZPbU1BUldEcjBqTFVuWmNoMEJsZlpsY0hTNnRXRW9B?=
 =?utf-8?B?blR4ZFdSaVNYSGFyTmJtbEJCYzhvSXNjVkFJYW5pVkRsanAvU053ajV2dnB5?=
 =?utf-8?B?eVBJSG96bVJVNHo3NlB3L2Nvc0JBL3V3Ykw4ajA0ZGJpN2ttRWo3WVRobzZD?=
 =?utf-8?B?b1pWY050SktFQ2FSUWlPUFM4cVRuR0RESkNaQTYrL0FkanQrVzhoSXVuVVA4?=
 =?utf-8?B?dS9UOTkweGRpNW5Iano5V3ZsY1VpMmhIWnBVRGNQaUxtQjZ2QkRlbEVPZ1lD?=
 =?utf-8?B?dHpQK0I3L2JjenB3MnBySUNrb2toekJScWdqYnRPRG1jeW45ZE1majZWbFdN?=
 =?utf-8?B?V0FBaVNiVFFpbGJ2UXRzaHNRV1d6aDVUVS9EMTNKZ0NETmtNVzU0bnJZYVlZ?=
 =?utf-8?B?YksyNXlnbG80d0tCUHpjTGpPWHR5Vy9va2JySmd3NHg0Skw0SGpEVko3dmpw?=
 =?utf-8?B?eGRJTWxlWHcyb1VicWE1U2VBa3BTUUpTTjhlSFhEUlY4aVh4TGF0eXdKS0ZU?=
 =?utf-8?B?c2F1R1pjdEJtYkQzdUlleEN3OTZzOU5rb0E5MnU4SnAwblU2MEFucnBrQjhx?=
 =?utf-8?B?S1krZWp1VVNzaWdLaklReGZsdmdESzYwdHdEejExbVdMZm9xUEo3NVBTVVpi?=
 =?utf-8?B?WGRuVldvUVZ3cGQ5ZW1HWVpnZG1xamcyMzVKZ3piOU1YWDVWK3U5UUEyVnNO?=
 =?utf-8?B?TUJidXQ0Q1piTXR5WTJOTUpOT3dWN2svUG1DaVE5bmxTcU9jdG0wZVhidjBn?=
 =?utf-8?B?am1rMDBzRm0ySnlsNUVXRmlRN1NsS3hINlpDUXVzQTBVVnFMYjRkMGRSL3ly?=
 =?utf-8?B?ZGppaVoyUW8ranh2eWFYZUk1RERJMHRQTzJqRTc1ZStZN3k2WmZUakV0c0VY?=
 =?utf-8?B?MW0wL3pWa1NGeldDRXp3aEFENDdtbTNVZVhJTnp5b3NLUHdTWW9ZY2pRdHBZ?=
 =?utf-8?B?T2V6NklVdHhCMjcvVjhDcnI2TG9ORzBmV2JYUS9sUTZvNmJlM1dGNGpPWUw2?=
 =?utf-8?B?dDhzcVNmVVFvZmVDekp4QXU5M2UvR2FSdXRJQUl4NUZ3WmVpVE1DK0tiT25J?=
 =?utf-8?B?ZmZ3VE5lek1XYkU0a3VBTVp5S0NjWjBpNjNMYXhLSllKaFdlVzU2Z3A3WVdP?=
 =?utf-8?B?UHlUUVhQYmRJTFhNbGE5NTk4V0RJQm9aNG84WUQzSmVJR2ZvQ1FBQkJabWVh?=
 =?utf-8?B?TUMvdUNlNWxXZ3NPV21JR2QrVHRXaU92Q0E2bVN2UTBrNENhYUJHa2tTa0I1?=
 =?utf-8?B?Qlp5OEhTamo3TmFrTkVQc0ZUYnI0SWpsczFmWExzODdtWnVUeU8vUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CB5E3E2AB9797479E2E8395A2989EB7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebb6bd6-faaa-415b-c73a-08defe1eb111
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 18:21:30.6045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVQyStNnNUw+uiLJ8NisBRtsseDBhsdRFIR7rodDbiPUXvoce+0y5v/B8jhRsBdymVj2NEQtVpfLUA/ILQ7wyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

T24gVHVlLCAyMDI2LTA4LTE4IGF0IDIwOjUyIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFRoZSBmcmFtZWJ1ZmZlciByZWdpb24gdGhpcyBmaWVsZCBkZXNjcmliZXMgaG9sZHMgdGhlIEdT
UCBmaXJtd2FyZQ0KPiBpbWFnZS4gSXQgaXMgYW4gRUxGIHVuZGVyIDU3MC4xNDQgYW5kIGlzIG5v
dCBvbmUgdW5kZXIgdGhlIGZpcm13YXJlIHRoaXMNCj4gc2VyaWVzIG1vdmVzIHRvLCBzbyBuYW1l
IHRoZSBmaWVsZCBmb3Igd2hhdCBpdCBob2xkcyByYXRoZXIgdGhhbiBmb3IgaXRzDQo+IGN1cnJl
bnQgZm9ybWF0Lg0KDQpJdCdzIG5vdCBhbiBFTEYgdW5kZXIgdGhlIDU3MCBlaXRoZXIuICBJdCdz
IG9ubHkgYW4gRUxGIHdpdGggbm9uLVRMVi4NCg==
