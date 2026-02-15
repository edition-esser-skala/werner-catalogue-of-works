\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]"
    r2 r4 r8 f'~
    f e f a,16 b c4 c
    r2 r4 r8 a'
    g f e4 d r
    R1*2 %6
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]"
    R1
    b'4 c8 f, g4 a
    r2 r4 r8 f'
    e d d8. cis16 d4 r
    R1*2 %6
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    a'4.^\solo f8 b a d c
    b8. b16 a4 r2
    r8 d4 cis8 d8. a16 a4
    r2 r4 d8 d16 d
    b8 d16 d g,8 \hA b c \hA b a16[ \hA b c a]
    f8 b c c16 d g,8 a16 a g4
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus,
  ad -- o -- ra -- mus te,
  gra -- ti -- as
  a -- gi -- mus ti -- bi pro -- pter ma --
  _ gnam glo -- ri -- am, glo -- ri -- am "tu -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r4 r8 f^\solo f e f4
    R1
    r2 d8 d16 d b8 d16 d
    g,8 b c \hA b a[ \hA b16 c] c8] c
    d16[ e f d] g8[ f16 g] e8 f16 f f8[ e]
  }
}

AltoLyrics = \lyricmode {
  lau -- da -- mus te,

  gra -- ti -- as a -- gi -- mus
  ti -- bi pro -- pter ma -- _ gnam
  glo -- _ _ ri -- am "tu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r4 a8.^\solo a16
    a8 g16 g a4 r2
    r4 a8 a16 a f8 a16 a d,8 f
    g g16[ f] e8 g c,[ d16 e] f[ g a f]
    b4. a16[ \hA b] c8 f,16 f c4
  }
}

TenoreLyrics = \lyricmode {
  be -- ne -- %2
  di -- ci -- mus te,
  gra -- ti -- as a -- gi -- mus ti -- bi
  pro -- pter ma -- gnam glo -- _
  _ _ _ ri -- am "tu -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    g'8.^\solo g16 a8 f c4 f,
    r2 r4 r8 d'
    g16[ a] b[ g] a8. a16 d,4 r
    R1
    r2 r4 c8 c16 c
  }
}

BassoLyrics = \lyricmode {
  bo -- nae vo -- lun -- ta -- tis,
  glo --
  ri -- fi -- ca -- mus te,

  Do -- mi -- ne
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]"
    d2-\solo d8 c b a
    g4 f8 d' c4 f,
    b a8 a16 g f4 f'8 d
    g4 a d,4. f8
    g g16 f e8 g c,4 f
    b4. a16 \hA b c8 f, c4
  }
}

BassFigures = \figuremode {
  r2 <6>8 <6> q q
  <7> <6>4. <4>8 <3>4.
  <7>8 <6> <4> <_+> <6>2
  <8 6 _->8 <7 5> <4> <_+>4. <6->8 <6>
  <_->4 <6>8 r <8 6> <7->4.
  r4 <2>8 r4. <4>8 <3>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName =  \markup \center-column { "T" "trb 2" }
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
