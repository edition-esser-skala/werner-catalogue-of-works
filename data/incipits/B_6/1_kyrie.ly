\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d'8. d16 fis16. a32 a16. g64 a h16. d,32 g,8 r16 r32 fis' fis16.\trill e64( fis)
    g16. h,32 e,8 r16 r32 e' e16.\trill d64( e) fis8 a a,8. g16
    fis16. fis'32 fis16.\trill e64( fis) gis,16. d'32 d16.\trill cis64 d cis32 e16. e32 g16. g32 b16. b32 cis!16.
    d16. a32 a16. f32 d16. a32 f16. d32 \tuplet 3/2 8 { b'16 a g } es'8~ es16( cis!) d8
    r16 r32 gis gis16.\trill fis64 \hA gis a16. a,32 a8\trill r a h, gis'
    a16( c) c( dis) dis( fis) fis( a) c c8 c16 c8 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d'8. d16 fis16. a32 a16.\trill g64 a h16. d,32 g,8 r16 r32 fis' fis16.\trill e64( fis)
    g16. h,32 e,8 r16 r32 e' e16.\trill d64( e) fis8 a a,8. g16
    fis16. fis'32 fis16.\trill e64( fis) gis,16. d'32 d16.\trill cis64 d cis32( e16.) e32( g16.) g32( b16.) b32( cis!16.)
    d16. a32 a16. f32 d16. a32 f16. d32 \tuplet 3/2 8 { b'16 a g } es'8~ es16( cis!) d8
    r16 r32 gis gis16.\trill fis64 \hA gis a16. a,32 a8\trill r a h, gis'
    a16( c) c( a) fis( dis') dis( fis) a a8 a16 a8 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    d'4.^\tutti d8 d4 dis
    e2~ e8[ d16 cis] d8[ e]
    d4. cis16[ h] cis4 r
    d4. d8 d es4 d8~
    d c4 c8 c4 h!\trill
    a8 r r4 c8. c16 c8 c
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _
  _ _ son,
  Ky -- ri -- e e -- _
  _ _ lei -- _
  son, Ky -- ri -- e "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    fis4.^\tutti fis8 g4 fis
    g4. fis16[ e] fis4 a
    fis gis a r
    a4. a8 g4 a
    gis a2 \hA gis4
    a8 r r4 fis!8. fis16 fis8 fis
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ son, e --
  lei -- _ son,
  Ky -- ri -- e e --
  lei -- _ _
  son, Ky -- ri -- e "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    a4.^\tutti a8 h4 h
    h8 cis4 e8 a,4 r8 a
    a4 h8[ gis] e4 r
    a d b a
    h8[ e] c? fis! e2
    e8 r r4 a,8. a16 a8 a
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- _ _ son, e --
  lei -- _ son,
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, Ky -- ri -- e "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    d4.^\tutti d8 g4 h
    e, a d,4. cis8
    d2 a4 r
    f'4. f8 g4 \hA f
    e f8 dis e2
    a,8 r r4 dis8. dis16 dis8 dis
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- _
  lei -- son,
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, Ky -- ri -- e "e -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Largo"
    d2-\tutti g4 h
    e, a d,4. cis8
    d2 a4 r
    f'4. f8 g4 \hA f
    e f8 dis e2
    a,8 r r4 dis4. dis8
  }
}

BassFigures = \figuremode {
  r2. <_+>4
  <5>8 <6\\> <7>4 <9>8 <8>4.
  <3>4 <4\+>2.
  <6>2 <5 _->8 <6- \t> <7-> <6>
  <7 _+> <6! \t> <5> <7! 5> <6 4>4 <5 _+>
  r2 <7! 5>
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
